import 'package:protein_structure/features/protein/domain/protein_model.dart';

sealed class ProteinDetailState {
  const ProteinDetailState();
}

final class ProteinDetailLoading extends ProteinDetailState {
  const ProteinDetailLoading();
}

final class ProteinDetailLoaded extends ProteinDetailState {
  const ProteinDetailLoaded(
    this.protein, {
    this.related = const [],
  });

  final ProteinModel protein;
  final List<ProteinModel> related;
}

final class ProteinDetailNotFound extends ProteinDetailState {
  const ProteinDetailNotFound(this.id);

  final String id;
}

final class ProteinDetailFailure extends ProteinDetailState {
  const ProteinDetailFailure(this.id, [this.error]);

  final String id;
  final Object? error;
}
