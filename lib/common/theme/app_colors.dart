import 'package:flutter/material.dart';
import 'package:protein_structure/features/protein/domain/protein_method.dart';

abstract final class AppColors {
  static const Color seed = Color(0xFF006494);

  static const Color methodXray = Color(0xFF1976D2);
  static const Color methodCryoEm = Color(0xFF00897B);
  static const Color methodNmr = Color(0xFFFB8C00);
  static const Color methodNeutron = Color(0xFF8E24AA);
  static const Color methodOther = Color(0xFF607D8B);

  static const Color resolutionHigh = Color(0xFF2E7D32);
  static const Color resolutionMedium = Color(0xFFF57F17);
  static const Color resolutionLow = Color(0xFFC62828);
  static const Color resolutionNmr = Color(0xFF546E7A);

  static Color colorForMethod(ProteinMethod method) => switch (method) {
    ProteinMethod.xray => methodXray,
    ProteinMethod.electronMicroscopy => methodCryoEm,
    ProteinMethod.nmr => methodNmr,
    ProteinMethod.neutron => methodNeutron,
    ProteinMethod.other => methodOther,
  };

  static Color colorForResolution(double? resolution) => switch (resolution) {
    null => resolutionNmr,
    < 1.8 => resolutionHigh,
    <= 2.5 => resolutionMedium,
    _ => resolutionLow,
  };
}
