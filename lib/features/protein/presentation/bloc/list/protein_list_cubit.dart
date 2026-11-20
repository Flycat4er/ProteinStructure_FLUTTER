import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/common/network/load_exception.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/presentation/bloc/list/protein_list_state.dart';

class ProteinListCubit extends Cubit<ProteinListState> {
  ProteinListCubit(this._repository)
      : super(const ProteinListLoading(query: ''));

  final IProteinRepository _repository;

  static const int _pageSize = 10;
  static const Duration _searchDelay = Duration(milliseconds: 400);

  Timer? _searchTimer;

  Future<void> load() => _load('');

  Future<void> retry() => _load(state.query);

  void search(String query) {
    _searchTimer?.cancel();
    _searchTimer = Timer(_searchDelay, () => _load(query.trim()));
  }

  Future<void> loadMore() async {
    final current = state;
    if (current is! ProteinListLoaded ||
        !current.hasMore ||
        current.isLoadingMore) {
      return;
    }
    emit(
      ProteinListLoaded(
        query: current.query,
        items: current.items,
        hasMore: true,
        isLoadingMore: true,
      ),
    );
    try {
      final next = current.query.isEmpty
          ? await _repository.getProteins(
              offset: current.items.length,
              limit: _pageSize,
            )
          : await _repository.searchProteins(
              current.query,
              offset: current.items.length,
              limit: _pageSize,
            );
      if (isClosed || state.query != current.query) return;
      emit(
        ProteinListLoaded(
          query: current.query,
          items: [...current.items, ...next],
          hasMore: next.length == _pageSize,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed || state.query != current.query) return;
      emit(
        ProteinListLoaded(
          query: current.query,
          items: current.items,
          hasMore: true,
          loadMoreError: error,
        ),
      );
    }
  }

  Future<void> _load(String query) async {
    emit(ProteinListLoading(query: query));
    try {
      final items = query.isEmpty
          ? await _repository.getProteins(offset: 0, limit: _pageSize)
          : await _repository.searchProteins(query, offset: 0, limit: _pageSize);
      if (isClosed || state.query != query) return;
      emit(
        ProteinListLoaded(
          query: query,
          items: items,
          hasMore: items.length == _pageSize,
        ),
      );
    } on LoadException catch (error) {
      if (isClosed || state.query != query) return;
      emit(ProteinListFailure(query: query, error: error));
    }
  }

  @override
  Future<void> close() {
    _searchTimer?.cancel();
    return super.close();
  }
}
