import 'dart:async';

import 'package:protein_structure/features/protein/data/data_sources/i_protein_data_source.dart';
import 'package:protein_structure/features/protein/data/dto/polymer_entity_dto.dart';
import 'package:protein_structure/features/protein/data/mappers/protein_mapper.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';

final class ProteinRepository implements IProteinRepository {
  const ProteinRepository(this._dataSource);

  final IProteinDataSource _dataSource;

  @override
  Future<List<ProteinModel>> getProteins({
    required int offset,
    required int limit,
  }) async {
    final response = await _dataSource.search(offset: offset, limit: limit);
    final ids = [for (final item in response.resultSet) item.identifier];
    if (ids.isEmpty) return const [];
    return _loadAll(ids);
  }

  @override
  Future<ProteinModel> getProtein(String id) =>
      _loadProtein(id, includeRelated: true);

  @override
  Future<List<ProteinModel>> searchProteins(
    String query, {
    int offset = 0,
    int limit = 10,
  }) async {
    final response = await _dataSource.search(
      query: query,
      offset: offset,
      limit: limit,
    );
    final ids = [for (final item in response.resultSet) item.identifier];
    if (ids.isEmpty) return const [];
    return _loadAll(ids);
  }

  @override
  Future<List<ProteinModel>> getProteinsByIds(List<String> ids) =>
      _loadAll(ids);

  Future<List<ProteinModel>> _loadAll(Iterable<String> ids) async {
    final models = await Future.wait([
      for (final id in ids) _loadProtein(id),
    ]);
    return models;
  }

  Future<ProteinModel> _loadProtein(
    String id, {
    bool includeRelated = false,
  }) async {
    final entry = await _dataSource.getEntry(id);

    PolymerEntityDto? polymer;
    try {
      polymer = await _dataSource.getPolymerEntity(id);
    } catch (_) {}

    var relatedIds = const <String>[];
    if (includeRelated) {
      final keyword = entry.structKeywords?.pdbxKeywords?.trim();
      if (keyword != null && keyword.isNotEmpty) {
        try {
          final relResponse = await _dataSource.search(
            query: keyword,
            offset: 0,
            limit: 6,
          );
          final target = id.toUpperCase();
          relatedIds = [
            for (final item in relResponse.resultSet)
              if (item.identifier.toUpperCase() != target) item.identifier,
          ].take(3).toList();
        } catch (_) {}
      }
    }

    return entry.toModel(
      polymer: polymer,
      relatedIds: relatedIds,
    );
  }
}
