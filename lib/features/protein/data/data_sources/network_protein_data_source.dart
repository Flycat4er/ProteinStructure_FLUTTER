import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:protein_structure/common/network/load_exception.dart';
import 'package:protein_structure/features/protein/data/api/protein_api.dart';
import 'package:protein_structure/features/protein/data/data_sources/i_protein_data_source.dart';
import 'package:protein_structure/features/protein/data/dto/polymer_entity_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_entry_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_search_response_dto.dart';

final class NetworkProteinDataSource implements IProteinDataSource {
  const NetworkProteinDataSource(this._api);

  final ProteinApi _api;

  @override
  Future<ProteinSearchResponseDto> search({
    String? query,
    required int offset,
    required int limit,
  }) =>
      _guard(() => _api.search(query: query, offset: offset, limit: limit));

  @override
  Future<ProteinEntryDto> getEntry(String id) =>
      _guard(() => _api.getEntry(id));

  @override
  Future<PolymerEntityDto> getPolymerEntity(
    String entryId, {
    int entityId = 1,
  }) =>
      _guard(() => _api.getPolymerEntity(entryId, entityId: entityId));

  Future<T> _guard<T>(Future<T> Function() request) async {
    try {
      return await request();
    } on DioException catch (error) {
      throw _fromDio(error);
    } on CheckedFromJsonException {
      throw const BadResponseException();
    } on FormatException {
      throw const BadResponseException();
    }
  }

  LoadException _fromDio(DioException error) => switch (error.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.transformTimeout =>
          const TimeoutLoadException(),
        DioExceptionType.badResponse when error.response?.statusCode == 404 =>
          const NotFoundException(),
        DioExceptionType.badResponse =>
          ServerException(error.response?.statusCode),
        DioExceptionType.unknown when error.error is FormatException =>
          const BadResponseException(),
        DioExceptionType.connectionError ||
        DioExceptionType.badCertificate ||
        DioExceptionType.cancel ||
        DioExceptionType.unknown =>
          const NoConnectionException(),
      };
}
