// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protein_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProteinEntryDto _$ProteinEntryDtoFromJson(Map<String, dynamic> json) =>
    ProteinEntryDto(
      rcsbId: json['rcsb_id'] as String,
      struct: json['struct'] == null
          ? null
          : EntryStructDto.fromJson(json['struct'] as Map<String, dynamic>),
      structKeywords: json['struct_keywords'] == null
          ? null
          : EntryStructKeywordsDto.fromJson(
              json['struct_keywords'] as Map<String, dynamic>,
            ),
      exptl:
          (json['exptl'] as List<dynamic>?)
              ?.map((e) => EntryExptlDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rcsbEntryInfo: json['rcsb_entry_info'] == null
          ? null
          : EntryInfoDto.fromJson(
              json['rcsb_entry_info'] as Map<String, dynamic>,
            ),
      rcsbAccessionInfo: json['rcsb_accession_info'] == null
          ? null
          : EntryAccessionInfoDto.fromJson(
              json['rcsb_accession_info'] as Map<String, dynamic>,
            ),
      auditAuthor:
          (json['audit_author'] as List<dynamic>?)
              ?.map((e) => EntryAuthorDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rcsbPrimaryCitation: json['rcsb_primary_citation'] == null
          ? null
          : EntryCitationDto.fromJson(
              json['rcsb_primary_citation'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProteinEntryDtoToJson(ProteinEntryDto instance) =>
    <String, dynamic>{
      'rcsb_id': instance.rcsbId,
      'struct': instance.struct,
      'struct_keywords': instance.structKeywords,
      'exptl': instance.exptl,
      'rcsb_entry_info': instance.rcsbEntryInfo,
      'rcsb_accession_info': instance.rcsbAccessionInfo,
      'audit_author': instance.auditAuthor,
      'rcsb_primary_citation': instance.rcsbPrimaryCitation,
    };

EntryStructDto _$EntryStructDtoFromJson(Map<String, dynamic> json) =>
    EntryStructDto(title: json['title'] as String?);

Map<String, dynamic> _$EntryStructDtoToJson(EntryStructDto instance) =>
    <String, dynamic>{'title': instance.title};

EntryStructKeywordsDto _$EntryStructKeywordsDtoFromJson(
  Map<String, dynamic> json,
) => EntryStructKeywordsDto(pdbxKeywords: json['pdbx_keywords'] as String?);

Map<String, dynamic> _$EntryStructKeywordsDtoToJson(
  EntryStructKeywordsDto instance,
) => <String, dynamic>{'pdbx_keywords': instance.pdbxKeywords};

EntryExptlDto _$EntryExptlDtoFromJson(Map<String, dynamic> json) =>
    EntryExptlDto(method: json['method'] as String?);

Map<String, dynamic> _$EntryExptlDtoToJson(EntryExptlDto instance) =>
    <String, dynamic>{'method': instance.method};

EntryInfoDto _$EntryInfoDtoFromJson(Map<String, dynamic> json) => EntryInfoDto(
  resolutionCombined:
      (json['resolution_combined'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList() ??
      [],
  molecularWeight: (json['molecular_weight'] as num?)?.toDouble(),
  depositedPolymerMonomerCount:
      (json['deposited_polymer_monomer_count'] as num?)?.toInt(),
  polymerComposition: json['polymer_composition'] as String?,
);

Map<String, dynamic> _$EntryInfoDtoToJson(EntryInfoDto instance) =>
    <String, dynamic>{
      'resolution_combined': instance.resolutionCombined,
      'molecular_weight': instance.molecularWeight,
      'deposited_polymer_monomer_count': instance.depositedPolymerMonomerCount,
      'polymer_composition': instance.polymerComposition,
    };

EntryAccessionInfoDto _$EntryAccessionInfoDtoFromJson(
  Map<String, dynamic> json,
) => EntryAccessionInfoDto(
  initialReleaseDate: json['initial_release_date'] as String?,
);

Map<String, dynamic> _$EntryAccessionInfoDtoToJson(
  EntryAccessionInfoDto instance,
) => <String, dynamic>{'initial_release_date': instance.initialReleaseDate};

EntryAuthorDto _$EntryAuthorDtoFromJson(Map<String, dynamic> json) =>
    EntryAuthorDto(name: json['name'] as String?);

Map<String, dynamic> _$EntryAuthorDtoToJson(EntryAuthorDto instance) =>
    <String, dynamic>{'name': instance.name};

EntryCitationDto _$EntryCitationDtoFromJson(Map<String, dynamic> json) =>
    EntryCitationDto(title: json['title'] as String?);

Map<String, dynamic> _$EntryCitationDtoToJson(EntryCitationDto instance) =>
    <String, dynamic>{'title': instance.title};
