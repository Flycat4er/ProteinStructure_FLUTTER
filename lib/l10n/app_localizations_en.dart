// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Protein Structures';

  @override
  String get searchHint => 'Search by ID or name';

  @override
  String get actionClearSearch => 'Clear search';

  @override
  String get actionToggleTheme => 'Toggle theme';

  @override
  String get actionToggleLocale => 'Change language';

  @override
  String get actionBack => 'Back';

  @override
  String get sectionGeneral => 'General Information';

  @override
  String get sectionStructure => 'Structure Parameters';

  @override
  String get sectionAuthors => 'Authors & Citation';

  @override
  String get sectionRelated => 'Related Structures';

  @override
  String get labelPdbId => 'PDB ID';

  @override
  String get labelOrganism => 'Organism';

  @override
  String get labelMethod => 'Method';

  @override
  String get labelResolution => 'Resolution';

  @override
  String get labelWeight => 'Mol. Weight';

  @override
  String get labelResidues => 'Residues';

  @override
  String get labelReleaseDate => 'Release Date';

  @override
  String get labelClassification => 'Classification';

  @override
  String resolutionFormat(String resolution) {
    return '$resolution Å';
  }

  @override
  String get resolutionNa => 'N/A (NMR)';

  @override
  String weightFormat(String weight) {
    return '$weight kDa';
  }

  @override
  String residuesFormat(String residues) {
    return '$residues residues';
  }

  @override
  String get emptySearchTitle => 'No proteins found';

  @override
  String get emptySearchDesc => 'Try searching by another name or PDB ID';

  @override
  String detailNotFound(String id) {
    return 'No record “$id” in the catalog';
  }

  @override
  String get pageNotFound => 'No such page';

  @override
  String get methodXray => 'X-Ray Diffraction';

  @override
  String get methodEm => 'Cryo-EM';

  @override
  String get methodNmr => 'Solution NMR';

  @override
  String get methodNeutron => 'Neutron Diffraction';

  @override
  String get methodOther => 'Other Method';

  @override
  String get errorLoad => 'Failed to load data';

  @override
  String get actionRetry => 'Retry';
}
