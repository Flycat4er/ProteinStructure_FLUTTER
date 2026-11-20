import 'package:protein_structure/features/protein/domain/protein_model.dart';

abstract interface class IProteinRepository {
  Future<List<ProteinModel>> getProteins({
    required int offset,
    required int limit,
  });

  Future<ProteinModel> getProtein(String id);

  Future<List<ProteinModel>> searchProteins(
    String query, {
    int offset = 0,
    int limit = 10,
  });

  Future<List<ProteinModel>> getProteinsByIds(List<String> ids);
}
