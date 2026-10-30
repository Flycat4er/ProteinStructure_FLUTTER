import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_event.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_state.dart';

class ProteinDetailBloc extends Bloc<ProteinDetailEvent, ProteinDetailState> {
  ProteinDetailBloc(this._repository) : super(const ProteinDetailLoading()) {
    on<ProteinDetailOpened>(_onOpened);
  }

  final IProteinRepository _repository;

  Future<void> _onOpened(
    ProteinDetailOpened event,
    Emitter<ProteinDetailState> emit,
  ) async {
    final protein = await _repository.getProtein(event.id);
    if (protein == null) {
      emit(ProteinDetailNotFound(event.id));
      return;
    }

    final related = await _repository.getProteinsByIds(protein.relatedIds);
    emit(ProteinDetailLoaded(protein, related: related));
  }
}
