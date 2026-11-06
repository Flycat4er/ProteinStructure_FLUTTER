import 'package:protein_structure/features/protein/data/mock_proteins.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';

final class ProteinRepository implements IProteinRepository {
  const ProteinRepository();

  @override
  Future<List<ProteinModel>> getProteins() async => mockProteins;

  @override
  Future<ProteinModel?> getProtein(String id) async {
    final target = id.trim().toUpperCase();
    for (final protein in mockProteins) {
      if (protein.id.toUpperCase() == target) return protein;
    }
    return null;
  }

  @override
  Future<List<ProteinModel>> searchProteins(String query) async {
    final needle = query.trim().toLowerCase();
    if (needle.isEmpty) return mockProteins;
    return [
      for (final protein in mockProteins)
        if (protein.id.toLowerCase().contains(needle) ||
            protein.shortName.toLowerCase().contains(needle) ||
            protein.title.toLowerCase().contains(needle) ||
            protein.organism.toLowerCase().contains(needle) ||
            protein.classification.toLowerCase().contains(needle))
          protein,
    ];
  }

  @override
  Future<List<ProteinModel>> getProteinsByIds(List<String> ids) async {
    final idSet = ids.map((e) => e.toUpperCase()).toSet();
    return [
      for (final protein in mockProteins)
        if (idSet.contains(protein.id.toUpperCase())) protein,
    ];
  }
}
