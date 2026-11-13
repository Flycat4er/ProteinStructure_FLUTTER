import 'package:protein_structure/features/protein/domain/protein_model.dart';

abstract interface class IProteinRepository {
  Future<List<ProteinModel>> getProteins();
  Future<ProteinModel?> getProtein(String id);
  Future<List<ProteinModel>> searchProteins(String query);
  Future<List<ProteinModel>> getProteinsByIds(List<String> ids);
}
