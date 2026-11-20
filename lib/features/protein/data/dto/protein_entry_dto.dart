import 'package:json_annotation/json_annotation.dart';

part 'protein_entry_dto.g.dart';

@JsonSerializable()
final class ProteinEntryDto {
  const ProteinEntryDto({
    required this.rcsbId,
    this.struct,
    this.structKeywords,
    this.exptl = const [],
    this.rcsbEntryInfo,
    this.rcsbAccessionInfo,
    this.auditAuthor = const [],
    this.rcsbPrimaryCitation,
  });

  factory ProteinEntryDto.fromJson(Map<String, dynamic> json) =>
      _$ProteinEntryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProteinEntryDtoToJson(this);

  @JsonKey(name: 'rcsb_id')
  final String rcsbId;

  final EntryStructDto? struct;

  @JsonKey(name: 'struct_keywords')
  final EntryStructKeywordsDto? structKeywords;

  @JsonKey(defaultValue: [])
  final List<EntryExptlDto> exptl;

  @JsonKey(name: 'rcsb_entry_info')
  final EntryInfoDto? rcsbEntryInfo;

  @JsonKey(name: 'rcsb_accession_info')
  final EntryAccessionInfoDto? rcsbAccessionInfo;

  @JsonKey(name: 'audit_author', defaultValue: [])
  final List<EntryAuthorDto> auditAuthor;

  @JsonKey(name: 'rcsb_primary_citation')
  final EntryCitationDto? rcsbPrimaryCitation;
}

@JsonSerializable()
final class EntryStructDto {
  const EntryStructDto({this.title});

  factory EntryStructDto.fromJson(Map<String, dynamic> json) =>
      _$EntryStructDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryStructDtoToJson(this);

  final String? title;
}

@JsonSerializable()
final class EntryStructKeywordsDto {
  const EntryStructKeywordsDto({this.pdbxKeywords});

  factory EntryStructKeywordsDto.fromJson(Map<String, dynamic> json) =>
      _$EntryStructKeywordsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryStructKeywordsDtoToJson(this);

  @JsonKey(name: 'pdbx_keywords')
  final String? pdbxKeywords;
}

@JsonSerializable()
final class EntryExptlDto {
  const EntryExptlDto({this.method});

  factory EntryExptlDto.fromJson(Map<String, dynamic> json) =>
      _$EntryExptlDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryExptlDtoToJson(this);

  final String? method;
}

@JsonSerializable()
final class EntryInfoDto {
  const EntryInfoDto({
    this.resolutionCombined = const [],
    this.molecularWeight,
    this.depositedPolymerMonomerCount,
    this.polymerComposition,
  });

  factory EntryInfoDto.fromJson(Map<String, dynamic> json) =>
      _$EntryInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryInfoDtoToJson(this);

  @JsonKey(name: 'resolution_combined', defaultValue: [])
  final List<double> resolutionCombined;

  @JsonKey(name: 'molecular_weight')
  final double? molecularWeight;

  @JsonKey(name: 'deposited_polymer_monomer_count')
  final int? depositedPolymerMonomerCount;

  @JsonKey(name: 'polymer_composition')
  final String? polymerComposition;
}

@JsonSerializable()
final class EntryAccessionInfoDto {
  const EntryAccessionInfoDto({this.initialReleaseDate});

  factory EntryAccessionInfoDto.fromJson(Map<String, dynamic> json) =>
      _$EntryAccessionInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryAccessionInfoDtoToJson(this);

  @JsonKey(name: 'initial_release_date')
  final String? initialReleaseDate;
}

@JsonSerializable()
final class EntryAuthorDto {
  const EntryAuthorDto({this.name});

  factory EntryAuthorDto.fromJson(Map<String, dynamic> json) =>
      _$EntryAuthorDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryAuthorDtoToJson(this);

  final String? name;
}

@JsonSerializable()
final class EntryCitationDto {
  const EntryCitationDto({this.title});

  factory EntryCitationDto.fromJson(Map<String, dynamic> json) =>
      _$EntryCitationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EntryCitationDtoToJson(this);

  final String? title;
}
