// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Структуры белков';

  @override
  String get searchHint => 'Поиск по ID или названию';

  @override
  String get actionClearSearch => 'Очистить поиск';

  @override
  String get actionToggleTheme => 'Переключить тему';

  @override
  String get actionToggleLocale => 'Сменить язык';

  @override
  String get actionBack => 'Назад';

  @override
  String get sectionGeneral => 'Общая информация';

  @override
  String get sectionStructure => 'Параметры структуры';

  @override
  String get sectionAuthors => 'Авторы и публикация';

  @override
  String get sectionRelated => 'Связанные структуры';

  @override
  String get labelPdbId => 'PDB ID';

  @override
  String get labelOrganism => 'Организм';

  @override
  String get labelMethod => 'Метод';

  @override
  String get labelResolution => 'Разрешение';

  @override
  String get labelWeight => 'Мол. масса';

  @override
  String get labelResidues => 'Остатки';

  @override
  String get labelReleaseDate => 'Дата релиза';

  @override
  String get labelClassification => 'Классификация';

  @override
  String resolutionFormat(String resolution) {
    return '$resolution Å';
  }

  @override
  String get resolutionNa => 'Н/Д (ЯМР)';

  @override
  String weightFormat(String weight) {
    return '$weight кДа';
  }

  @override
  String residuesFormat(String residues) {
    return '$residues а.о.';
  }

  @override
  String get emptySearchTitle => 'Ничего не найдено';

  @override
  String get emptySearchDesc =>
      'Попробуйте изменить поисковый запрос или PDB ID';

  @override
  String detailNotFound(String id) {
    return 'Записи «$id» в каталоге нет';
  }

  @override
  String get pageNotFound => 'Такой страницы нет';

  @override
  String get methodXray => 'Рентгеноструктурный анализ';

  @override
  String get methodEm => 'Криоэлектронная микроскопия';

  @override
  String get methodNmr => 'ЯМР-спектроскопия';

  @override
  String get methodNeutron => 'Нейтронография';

  @override
  String get methodOther => 'Другой метод';
}
