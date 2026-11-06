import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:protein_structure/common/navigation/app_router.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';
import 'package:protein_structure/features/protein/presentation/utils/protein_format.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/card_surface.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/method_badge.dart';
import 'package:protein_structure/features/protein/presentation/view/widgets/resolution_badge.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class ProteinCard extends StatelessWidget {
  const ProteinCard({
    super.key,
    required this.protein,
  });

  final ProteinModel protein;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return CardSurface(
      onTap: () => context.push(AppRoutes.detail(protein.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                protein.displayId,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontFamily: 'monospace',
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              ResolutionBadge(resolution: protein.resolution),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            protein.displayName,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            protein.organism,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MethodBadge(method: protein.method),
              Text(
                '${l10n.weightFormat(protein.weightFormatted)} • ${l10n.residuesFormat(protein.residuesFormatted)}',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.outline,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
