import 'package:flutter/material.dart';
import 'package:protein_structure/common/theme/app_colors.dart';
import 'package:protein_structure/features/protein/domain/protein_method.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';
import 'package:protein_structure/l10n/app_localizations.dart';

extension ProteinMethodFormat on ProteinMethod {
  Color get color => switch (this) {
    ProteinMethod.xray => AppColors.methodXray,
    ProteinMethod.electronMicroscopy => AppColors.methodCryoEm,
    ProteinMethod.nmr => AppColors.methodNmr,
    ProteinMethod.neutron => AppColors.methodNeutron,
    ProteinMethod.other => AppColors.methodOther,
  };

  String label(AppLocalizations l10n) => switch (this) {
    ProteinMethod.xray => l10n.methodXray,
    ProteinMethod.electronMicroscopy => l10n.methodEm,
    ProteinMethod.nmr => l10n.methodNmr,
    ProteinMethod.neutron => l10n.methodNeutron,
    ProteinMethod.other => l10n.methodOther,
  };
}

extension ProteinResolutionFormat on double? {
  Color get resolutionColor => switch (this) {
    null => AppColors.resolutionNmr,
    < 1.8 => AppColors.resolutionHigh,
    <= 2.5 => AppColors.resolutionMedium,
    _ => AppColors.resolutionLow,
  };
}

extension ProteinFormat on ProteinModel {
  String get displayId => id.toUpperCase();
  String get displayName => shortName;
  String get weightFormatted => molecularWeightKDa.toStringAsFixed(1);
  String get residuesFormatted => monomerCount.toString();
  String? get resolutionFormatted => resolution?.toStringAsFixed(2);
  Color get methodColor => method.color;
  Color get resolutionColor => resolution.resolutionColor;
}
