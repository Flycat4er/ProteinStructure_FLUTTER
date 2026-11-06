import 'package:protein_structure/features/protein/domain/protein_method.dart';

final class ProteinModel {
  const ProteinModel({
    required this.id,
    required this.shortName,
    required this.title,
    required this.organism,
    required this.classification,
    required this.method,
    required this.resolution,
    required this.polymerComposition,
    required this.monomerCount,
    required this.molecularWeightKDa,
    required this.releaseDate,
    required this.authors,
    this.citationTitle,
    this.relatedIds = const [],
  });

  final String id;
  final String shortName;
  final String title;
  final String organism;
  final String classification;
  final ProteinMethod method;
  final double? resolution;
  final String polymerComposition;
  final int monomerCount;
  final double molecularWeightKDa;
  final String releaseDate;
  final List<String> authors;
  final String? citationTitle;
  final List<String> relatedIds;
}
