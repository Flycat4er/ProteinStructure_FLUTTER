import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:protein_structure/common/network/dio_client.dart';
import 'package:protein_structure/features/protein/data/dto/polymer_entity_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_entry_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_search_response_dto.dart';

final class ProteinApi {
  const ProteinApi(this._dio);

  final Dio _dio;

  Future<ProteinSearchResponseDto> search({
    String? query,
    required int offset,
    required int limit,
  }) async {
    final trimmed = query?.trim() ?? '';
    final Map<String, dynamic> queryObj = trimmed.isEmpty
        ? {
            'type': 'terminal',
            'service': 'text',
            'parameters': {
              'attribute': 'rcsb_entry_info.selected_polymer_entity_types',
              'operator': 'exact_match',
              'value': 'Protein (only)',
            },
          }
        : {
            'type': 'group',
            'logical_operator': 'and',
            'nodes': [
              {
                'type': 'terminal',
                'service': 'full_text',
                'parameters': {'value': trimmed},
              },
              {
                'type': 'terminal',
                'service': 'text',
                'parameters': {
                  'attribute':
                      'rcsb_entry_info.selected_polymer_entity_types',
                  'operator': 'exact_match',
                  'value': 'Protein (only)',
                },
              },
            ],
          };

    final payload = {
      'query': queryObj,
      'return_type': 'entry',
      'request_options': {
        'paginate': {'start': offset, 'rows': limit},
        if (trimmed.isEmpty)
          'sort': [
            {
              'sort_by': 'rcsb_accession_info.initial_release_date',
              'direction': 'desc',
            }
          ],
      },
    };

    final response = await _dio.get<dynamic>(
      '${DioClient.searchBaseUrl}/rcsbsearch/v2/query',
      queryParameters: {'json': jsonEncode(payload)},
    );

    if (response.statusCode == 204 || response.data == null) {
      return const ProteinSearchResponseDto();
    }

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return ProteinSearchResponseDto.fromJson(data);
    }
    if (data is String && data.isNotEmpty) {
      final decoded = jsonDecode(data);
      if (decoded is Map<String, dynamic>) {
        return ProteinSearchResponseDto.fromJson(decoded);
      }
    }

    return const ProteinSearchResponseDto();
  }

  Future<ProteinEntryDto> getEntry(String id) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${DioClient.dataBaseUrl}/rest/v1/core/entry/$id',
    );
    final data = response.data;
    if (data == null) {
      throw const FormatException('Empty response');
    }
    return ProteinEntryDto.fromJson(data);
  }

  Future<PolymerEntityDto> getPolymerEntity(
    String entryId, {
    int entityId = 1,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '${DioClient.dataBaseUrl}/rest/v1/core/polymer_entity/$entryId/$entityId',
    );
    final data = response.data;
    if (data == null) {
      throw const FormatException('Empty response');
    }
    return PolymerEntityDto.fromJson(data);
  }
}
