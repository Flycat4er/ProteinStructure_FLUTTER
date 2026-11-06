import 'package:flutter/material.dart';
import 'package:protein_structure/features/protein/domain/protein_method.dart';
import 'package:protein_structure/features/protein/presentation/utils/protein_format.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

class MethodBadge extends StatelessWidget {
  const MethodBadge({
    super.key,
    required this.method,
  });

  final ProteinMethod method;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final color = method.color;
    final text = method.label(l10n);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
