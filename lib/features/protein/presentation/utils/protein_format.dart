import 'package:flutter/material.dart';
import 'package:protein_structure/common/theme/app_colors.dart';
import 'package:protein_structure/features/protein/domain/protein_model.dart';

extension ProteinFormat on ProteinModel {
  String get displayId => id.toUpperCase();
  String get displayName => shortName;
  String get weightFormatted => molecularWeightKDa.toStringAsFixed(1);
  String get residuesFormatted => monomerCount.toString();
  String? get resolutionFormatted => resolution?.toStringAsFixed(2);
  Color get methodColor => AppColors.colorForMethod(method);
  Color get resolutionColor => AppColors.colorForResolution(resolution);
}
