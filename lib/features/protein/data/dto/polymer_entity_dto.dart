import 'package:json_annotation/json_annotation.dart';

part 'polymer_entity_dto.g.dart';

@JsonSerializable()
final class PolymerEntityDto {
  const PolymerEntityDto({
    this.rcsbPolymerEntity,
    this.rcsbEntitySourceOrganism = const [],
  });

  factory PolymerEntityDto.fromJson(Map<String, dynamic> json) =>
      _$PolymerEntityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PolymerEntityDtoToJson(this);

  @JsonKey(name: 'rcsb_polymer_entity')
  final PolymerEntityDetailsDto? rcsbPolymerEntity;

  @JsonKey(name: 'rcsb_entity_source_organism', defaultValue: [])
  final List<EntitySourceOrganismDto> rcsbEntitySourceOrganism;
}

@JsonSerializable()
final class PolymerEntityDetailsDto {
  const PolymerEntityDetailsDto({
    this.pdbxDescription,
    this.formulaWeight,
  });

  factory PolymerEntityDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$PolymerEntityDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PolymerEntityDetailsDtoToJson(this);

  @JsonKey(name: 'pdbx_description')
  final String? pdbxDescription;

  @JsonKey(name: 'formula_weight')
  final double? formulaWeight;
}

@JsonSerializable()
final class EntitySourceOrganismDto {
  const EntitySourceOrganismDto({
    this.scientificName,
    this.commonName,
  });

  factory EntitySourceOrganismDto.fromJson(Map<String, dynamic> json) =>
      _$EntitySourceOrganismDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntitySourceOrganismDtoToJson(this);

  @JsonKey(name: 'scientific_name')
  final String? scientificName;

  @JsonKey(name: 'common_name')
  final String? commonName;
}
