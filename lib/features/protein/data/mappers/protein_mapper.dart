import 'package:protein_structure/features/protein/data/dto/polymer_entity_dto.dart';
import 'package:protein_structure/features/protein/data/dto/protein_entry_dto.dart';
import 'package:protein_structure/features/protein/domain/protein_method.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';

extension ProteinEntryDtoMapper on ProteinEntryDto {
  ProteinModel toModel({
    PolymerEntityDto? polymer,
    List<String> relatedIds = const [],
  }) {
    final rawMethod = exptl.isNotEmpty ? exptl.first.method ?? '' : '';
    final method = ProteinMethod.fromRaw(rawMethod);

    final resolution = (rcsbEntryInfo?.resolutionCombined.isNotEmpty ?? false)
        ? rcsbEntryInfo!.resolutionCombined.first
        : null;

    final shortName = polymer?.rcsbPolymerEntity?.pdbxDescription?.trim() ??
        struct?.title?.trim() ??
        rcsbId;

    final organism = (polymer?.rcsbEntitySourceOrganism.isNotEmpty ?? false)
        ? polymer!.rcsbEntitySourceOrganism.first.scientificName ??
            polymer.rcsbEntitySourceOrganism.first.commonName ??
            'Unknown'
        : 'Unknown';

    final classification = structKeywords?.pdbxKeywords?.trim() ?? 'Other';

    final polymerComposition =
        rcsbEntryInfo?.polymerComposition ?? 'protein';

    final monomerCount =
        rcsbEntryInfo?.depositedPolymerMonomerCount ?? 0;

    final molecularWeight =
        rcsbEntryInfo?.molecularWeight ??
        polymer?.rcsbPolymerEntity?.formulaWeight ??
        0.0;

    final rawDate = rcsbAccessionInfo?.initialReleaseDate ?? '';
    final releaseDate =
        rawDate.length >= 10 ? rawDate.substring(0, 10) : rawDate;

    final authors = [
      for (final author in auditAuthor)
        if (author.name != null && author.name!.isNotEmpty) author.name!,
    ];

    return ProteinModel(
      id: rcsbId,
      shortName: shortName,
      title: struct?.title?.trim() ?? rcsbId,
      organism: organism,
      classification: classification,
      method: method,
      resolution: resolution,
      polymerComposition: polymerComposition,
      monomerCount: monomerCount,
      molecularWeightKDa: molecularWeight,
      releaseDate: releaseDate,
      authors: authors,
      citationTitle: rcsbPrimaryCitation?.title?.trim(),
      relatedIds: relatedIds,
    );
  }
}
