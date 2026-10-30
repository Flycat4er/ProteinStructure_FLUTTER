import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:protein_structure/common/widgets/app_scaffold.dart';
import 'package:protein_structure/features/protein/domain/i_protein_repository.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_bloc.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_event.dart';
import 'package:protein_structure/features/protein/presentation/bloc/detail/protein_detail_state.dart';
import 'package:protein_structure/features/protein/presentation/utils/protein_format.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/fact_item.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/method_badge.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/protein_card.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/resolution_badge.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/section_header.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class ProteinDetailScreen extends StatelessWidget {
  const ProteinDetailScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProteinDetailBloc(
        context.read<IProteinRepository>(),
      )..add(ProteinDetailOpened(id)),
      child: AppScaffold(
        body: BlocBuilder<ProteinDetailBloc, ProteinDetailState>(
          builder: (context, state) => switch (state) {
            ProteinDetailLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            ProteinDetailNotFound(:final id) => Center(
              child: Text(
                AppLocalizations.of(context).detailNotFound(id),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ProteinDetailLoaded(:final protein, :final related) =>
              _DetailContent(protein: protein, related: related),
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    required this.protein,
    required this.related,
  });

  final ProteinModel protein;
  final List<ProteinModel> related;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    final otherRelated = related.where((r) => r.id != protein.id).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    protein.displayId,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  ResolutionBadge(resolution: protein.resolution),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                protein.displayName,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                protein.title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              MethodBadge(method: protein.method),
              SectionHeader(title: l10n.sectionGeneral),
              FactItem(label: l10n.labelPdbId, value: protein.displayId),
              FactItem(label: l10n.labelOrganism, value: protein.organism),
              FactItem(label: l10n.labelClassification, value: protein.classification),
              FactItem(label: l10n.labelReleaseDate, value: protein.releaseDate),
              SectionHeader(title: l10n.sectionStructure),
              FactItem(
                label: l10n.labelResolution,
                value: protein.resolution != null
                    ? l10n.resolutionFormat(protein.resolution!.toStringAsFixed(2))
                    : l10n.resolutionNa,
              ),
              FactItem(
                label: l10n.labelWeight,
                value: l10n.weightFormat(protein.weightFormatted),
              ),
              FactItem(
                label: l10n.labelResidues,
                value: l10n.residuesFormat(protein.residuesFormatted),
              ),
              if (protein.authors.isNotEmpty || protein.citationTitle != null) ...[
                SectionHeader(title: l10n.sectionAuthors),
                if (protein.authors.isNotEmpty)
                  Text(
                    protein.authors.join(', '),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                if (protein.citationTitle != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    '«${protein.citationTitle}»',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ],
              ],
              if (otherRelated.isNotEmpty) ...[
                SectionHeader(title: l10n.sectionRelated),
                const SizedBox(height: 8),
                for (final relatedProtein in otherRelated) ...[
                  ProteinCard(protein: relatedProtein),
                  const SizedBox(height: 10),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
