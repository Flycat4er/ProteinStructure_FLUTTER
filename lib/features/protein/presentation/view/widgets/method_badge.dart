import 'package:flutter/material.dart';
import 'package:protein_structure/common/theme/app_colors.dart';
import 'package:protein_structure/features/protein/domain/protein_method.dart';
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
    final color = AppColors.colorForMethod(method);

    final text = switch (method) {
      ProteinMethod.xray => l10n.methodXray,
      ProteinMethod.electronMicroscopy => l10n.methodEm,
      ProteinMethod.nmr => l10n.methodNmr,
      ProteinMethod.neutron => l10n.methodNeutron,
      ProteinMethod.other => l10n.methodOther,
    };

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
