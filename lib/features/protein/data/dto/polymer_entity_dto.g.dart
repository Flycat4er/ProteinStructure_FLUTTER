// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polymer_entity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolymerEntityDto _$PolymerEntityDtoFromJson(Map<String, dynamic> json) =>
    PolymerEntityDto(
      rcsbPolymerEntity: json['rcsb_polymer_entity'] == null
          ? null
          : PolymerEntityDetailsDto.fromJson(
              json['rcsb_polymer_entity'] as Map<String, dynamic>,
            ),
      rcsbEntitySourceOrganism:
          (json['rcsb_entity_source_organism'] as List<dynamic>?)
              ?.map(
                (e) =>
                    EntitySourceOrganismDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          [],
    );

Map<String, dynamic> _$PolymerEntityDtoToJson(PolymerEntityDto instance) =>
    <String, dynamic>{
      'rcsb_polymer_entity': instance.rcsbPolymerEntity,
      'rcsb_entity_source_organism': instance.rcsbEntitySourceOrganism,
    };

PolymerEntityDetailsDto _$PolymerEntityDetailsDtoFromJson(
  Map<String, dynamic> json,
) => PolymerEntityDetailsDto(
  pdbxDescription: json['pdbx_description'] as String?,
  formulaWeight: (json['formula_weight'] as num?)?.toDouble(),
);

Map<String, dynamic> _$PolymerEntityDetailsDtoToJson(
  PolymerEntityDetailsDto instance,
) => <String, dynamic>{
  'pdbx_description': instance.pdbxDescription,
  'formula_weight': instance.formulaWeight,
};

EntitySourceOrganismDto _$EntitySourceOrganismDtoFromJson(
  Map<String, dynamic> json,
) => EntitySourceOrganismDto(
  scientificName: json['scientific_name'] as String?,
  commonName: json['common_name'] as String?,
);

Map<String, dynamic> _$EntitySourceOrganismDtoToJson(
  EntitySourceOrganismDto instance,
) => <String, dynamic>{
  'scientific_name': instance.scientificName,
  'common_name': instance.commonName,
};
