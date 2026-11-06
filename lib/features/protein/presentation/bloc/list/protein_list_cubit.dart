import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/presentation/bloc/list/protein_list_state.dart';

class ProteinListCubit extends Cubit<ProteinListState> {
  ProteinListCubit(this._repository) : super(const ProteinListLoading());

  final IProteinRepository _repository;

  Future<void> load() => _load('');

  Future<void> search(String query) => _load(query);

  Future<void> _load(String query) async {
    emit(ProteinListLoading(query: query));
    final trimmed = query.trim();
    final items = trimmed.isEmpty
        ? await _repository.getProteins()
        : await _repository.searchProteins(trimmed);
    if (isClosed || state.query != query) return;
    emit(ProteinListLoaded(query: query, items: items));
  }
}
