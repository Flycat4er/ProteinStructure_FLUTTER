import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/common/network/load_exception.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_event.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_state.dart';

class ProteinDetailBloc extends Bloc<ProteinDetailEvent, ProteinDetailState> {
  ProteinDetailBloc(this._repository) : super(const ProteinDetailLoading()) {
    on<ProteinDetailOpened>(_onLoadRequested);
    on<ProteinDetailRetried>(_onLoadRequested);
  }

  final IProteinRepository _repository;

  Future<void> _onLoadRequested(
    ProteinDetailEvent event,
    Emitter<ProteinDetailState> emit,
  ) async {
    emit(const ProteinDetailLoading());
    try {
      final protein = await _repository.getProtein(event.id);
      if (isClosed) return;

      var related = const <ProteinModel>[];
      if (protein.relatedIds.isNotEmpty) {
        related = await _repository.getProteinsByIds(protein.relatedIds);
        if (isClosed) return;
      }

      emit(ProteinDetailLoaded(protein, related: related));
    } on NotFoundException {
      if (isClosed) return;
      emit(ProteinDetailNotFound(event.id));
    } on LoadException catch (error) {
      if (isClosed) return;
      emit(ProteinDetailFailure(event.id, error));
    }
  }
}
