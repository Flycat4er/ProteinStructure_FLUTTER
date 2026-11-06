import 'package:flutter/material.dart';
import 'package:protein_structure/features/protein/presentation/utils/protein_format.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class ResolutionBadge extends StatelessWidget {
  const ResolutionBadge({
    super.key,
    required this.resolution,
  });

  final double? resolution;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final color = resolution.resolutionColor;
    final text = resolution != null
        ? l10n.resolutionFormat(resolution!.toStringAsFixed(2))
        : l10n.resolutionNa;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
