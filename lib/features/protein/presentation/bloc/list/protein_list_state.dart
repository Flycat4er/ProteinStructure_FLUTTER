import 'package:protein_structure/features/protein/domain/protein_model.dart';

final class ProteinListState {
  const ProteinListState({
    this.query = '',
    this.items = const [],
  });

  final String query;
  final List<ProteinModel> items;

  ProteinListState copyWith({
    String? query,
    List<ProteinModel>? items,
  }) => ProteinListState(
    query: query ?? this.query,
    items: items ?? this.items,
  );
}
