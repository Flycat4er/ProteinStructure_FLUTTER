import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// Заголовок в шапке и во вкладке браузера
  ///
  /// In ru, this message translates to:
  /// **'Структуры белков'**
  String get appTitle;

  /// No description provided for @searchHint.
  ///
  /// In ru, this message translates to:
  /// **'Поиск по ID или названию'**
  String get searchHint;

  /// No description provided for @actionClearSearch.
  ///
  /// In ru, this message translates to:
  /// **'Очистить поиск'**
  String get actionClearSearch;

  /// No description provided for @actionToggleTheme.
  ///
  /// In ru, this message translates to:
  /// **'Переключить тему'**
  String get actionToggleTheme;

  /// No description provided for @actionToggleLocale.
  ///
  /// In ru, this message translates to:
  /// **'Сменить язык'**
  String get actionToggleLocale;

  /// No description provided for @actionBack.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get actionBack;

  /// No description provided for @sectionGeneral.
  ///
  /// In ru, this message translates to:
  /// **'Общая информация'**
  String get sectionGeneral;

  /// No description provided for @sectionStructure.
  ///
  /// In ru, this message translates to:
  /// **'Параметры структуры'**
  String get sectionStructure;

  /// No description provided for @sectionAuthors.
  ///
  /// In ru, this message translates to:
  /// **'Авторы и публикация'**
  String get sectionAuthors;

  /// No description provided for @sectionRelated.
  ///
  /// In ru, this message translates to:
  /// **'Связанные структуры'**
  String get sectionRelated;

  /// No description provided for @labelPdbId.
  ///
  /// In ru, this message translates to:
  /// **'PDB ID'**
  String get labelPdbId;

  /// No description provided for @labelOrganism.
  ///
  /// In ru, this message translates to:
  /// **'Организм'**
  String get labelOrganism;

  /// No description provided for @labelMethod.
  ///
  /// In ru, this message translates to:
  /// **'Метод'**
  String get labelMethod;

  /// No description provided for @labelResolution.
  ///
  /// In ru, this message translates to:
  /// **'Разрешение'**
  String get labelResolution;

  /// No description provided for @labelWeight.
  ///
  /// In ru, this message translates to:
  /// **'Мол. масса'**
  String get labelWeight;

  /// No description provided for @labelResidues.
  ///
  /// In ru, this message translates to:
  /// **'Остатки'**
  String get labelResidues;

  /// No description provided for @labelReleaseDate.
  ///
  /// In ru, this message translates to:
  /// **'Дата релиза'**
  String get labelReleaseDate;

  /// No description provided for @labelClassification.
  ///
  /// In ru, this message translates to:
  /// **'Классификация'**
  String get labelClassification;

  /// No description provided for @resolutionFormat.
  ///
  /// In ru, this message translates to:
  /// **'{resolution} Å'**
  String resolutionFormat(String resolution);

  /// No description provided for @resolutionNa.
  ///
  /// In ru, this message translates to:
  /// **'Н/Д (ЯМР)'**
  String get resolutionNa;

  /// No description provided for @weightFormat.
  ///
  /// In ru, this message translates to:
  /// **'{weight} кДа'**
  String weightFormat(String weight);

  /// No description provided for @residuesFormat.
  ///
  /// In ru, this message translates to:
  /// **'{residues} а.о.'**
  String residuesFormat(String residues);

  /// No description provided for @emptySearchTitle.
  ///
  /// In ru, this message translates to:
  /// **'Ничего не найдено'**
  String get emptySearchTitle;

  /// No description provided for @emptySearchDesc.
  ///
  /// In ru, this message translates to:
  /// **'Попробуйте изменить поисковый запрос или PDB ID'**
  String get emptySearchDesc;

  /// ID из адресной строки не нашёлся
  ///
  /// In ru, this message translates to:
  /// **'Записи «{id}» в каталоге нет'**
  String detailNotFound(String id);

  /// Адрес, которого нет среди маршрутов
  ///
  /// In ru, this message translates to:
  /// **'Такой страницы нет'**
  String get pageNotFound;

  /// No description provided for @methodXray.
  ///
  /// In ru, this message translates to:
  /// **'Рентгеноструктурный анализ'**
  String get methodXray;

  /// No description provided for @methodEm.
  ///
  /// In ru, this message translates to:
  /// **'Криоэлектронная микроскопия'**
  String get methodEm;

  /// No description provided for @methodNmr.
  ///
  /// In ru, this message translates to:
  /// **'ЯМР-спектроскопия'**
  String get methodNmr;

  /// No description provided for @methodNeutron.
  ///
  /// In ru, this message translates to:
  /// **'Нейтронография'**
  String get methodNeutron;

  /// No description provided for @methodOther.
  ///
  /// In ru, this message translates to:
  /// **'Другой метод'**
  String get methodOther;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
