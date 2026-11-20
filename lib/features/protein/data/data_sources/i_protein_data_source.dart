import 'package:protein_structure/features/protein/data/dto/polymer_entity_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_entry_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_search_response_dto.dart';

abstract interface class IProteinDataSource {
  Future<ProteinSearchResponseDto> search({
    String? query,
    required int offset,
    required int limit,
  });

  Future<ProteinEntryDto> getEntry(String id);

  Future<PolymerEntityDto> getPolymerEntity(
    String entryId, {
    int entityId = 1,
  });
}
