import 'package:json_annotation/json_annotation.dart';

part 'protein_search_response_dto.g.dart';

@JsonSerializable()
final class ProteinSearchResponseDto {
  const ProteinSearchResponseDto({
    this.totalCount = 0,
    this.resultSet = const [],
  });

  factory ProteinSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ProteinSearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProteinSearchResponseDtoToJson(this);

  @JsonKey(name: 'total_count', defaultValue: 0)
  final int totalCount;

  @JsonKey(name: 'result_set', defaultValue: [])
  final List<ProteinSearchResultDto> resultSet;
}

@JsonSerializable()
final class ProteinSearchResultDto {
  const ProteinSearchResultDto({
    required this.identifier,
    this.score,
  });

  factory ProteinSearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$ProteinSearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProteinSearchResultDtoToJson(this);

  final String identifier;
  final double? score;
}
