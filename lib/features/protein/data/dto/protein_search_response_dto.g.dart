// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protein_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProteinSearchResponseDto _$ProteinSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => ProteinSearchResponseDto(
  totalCount: (json['total_count'] as num?)?.toInt() ?? 0,
  resultSet:
      (json['result_set'] as List<dynamic>?)
          ?.map(
            (e) => ProteinSearchResultDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      [],
);

Map<String, dynamic> _$ProteinSearchResponseDtoToJson(
  ProteinSearchResponseDto instance,
) => <String, dynamic>{
  'total_count': instance.totalCount,
  'result_set': instance.resultSet,
};

ProteinSearchResultDto _$ProteinSearchResultDtoFromJson(
  Map<String, dynamic> json,
) => ProteinSearchResultDto(
  identifier: json['identifier'] as String,
  score: (json['score'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ProteinSearchResultDtoToJson(
  ProteinSearchResultDto instance,
) => <String, dynamic>{
  'identifier': instance.identifier,
  'score': instance.score,
};
