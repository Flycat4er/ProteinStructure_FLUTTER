import 'package:protein_structure/features/protein/domain/protein_model.dart';

sealed class ProteinListState {
  const ProteinListState({this.query = ''});

  final String query;
}

final class ProteinListLoading extends ProteinListState {
  const ProteinListLoading({super.query});
}

final class ProteinListLoaded extends ProteinListState {
  const ProteinListLoaded({
    super.query,
    this.items = const [],
  });

  final List<ProteinModel> items;

  ProteinListLoaded copyWith({
    String? query,
    List<ProteinModel>? items,
  }) =>
      ProteinListLoaded(
        query: query ?? this.query,
        items: items ?? this.items,
      );
}
