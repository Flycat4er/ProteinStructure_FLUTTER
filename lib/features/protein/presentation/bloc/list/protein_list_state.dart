import 'package:protein_structure/common/network/load_exception.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';

sealed class ProteinListState {
  const ProteinListState({required this.query});

  final String query;
}

final class ProteinListLoading extends ProteinListState {
  const ProteinListLoading({required super.query});
}

final class ProteinListLoaded extends ProteinListState {
  const ProteinListLoaded({
    required super.query,
    required this.items,
    required this.hasMore,
    this.isLoadingMore = false,
    this.loadMoreError,
  });

  final List<ProteinModel> items;
  final bool hasMore;
  final bool isLoadingMore;
  final LoadException? loadMoreError;
}

final class ProteinListFailure extends ProteinListState {
  const ProteinListFailure({
    required super.query,
    required this.error,
  });

  final LoadException error;
}
