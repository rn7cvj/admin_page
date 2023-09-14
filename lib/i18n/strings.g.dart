/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 52 (26 per locale)
///
/// Built on 2023-09-14 at 06:18 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsCalculatorEn calculator = _StringsCalculatorEn._(_root);
	late final _StringsCalendarEn calendar = _StringsCalendarEn._(_root);
	late final _StringsDashboardEn dashboard = _StringsDashboardEn._(_root);
	late final _StringsPeopleEn people = _StringsPeopleEn._(_root);
	late final _StringsScannedEn scanned = _StringsScannedEn._(_root);
	late final _StringsScannerEn scanner = _StringsScannerEn._(_root);
	late final _StringsServicesEn services = _StringsServicesEn._(_root);
}

// Path: calculator
class _StringsCalculatorEn {
	_StringsCalculatorEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Calculator';
}

// Path: calendar
class _StringsCalendarEn {
	_StringsCalendarEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Calendar';
}

// Path: dashboard
class _StringsDashboardEn {
	_StringsDashboardEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Dashboard';
}

// Path: people
class _StringsPeopleEn {
	_StringsPeopleEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'People';
	String get tab_visitor => 'Visiotrs';
	String get tab_trainer => 'Trainers';
	String get tab_staff => 'Staff';
	String get sort => 'Sort';
	String get filter => 'Filter';
	String get download => 'Download';
	String get column_fullname => 'Fullname';
	String get column_sex => 'Sex';
	String get column_birthdate => 'Birthdate';
	String get column_status => 'Status';
	String get column_phone_number => 'Phone number';
	String get column_last_visit => 'Last visit';
	String get column_profile => 'Profile';
}

// Path: scanned
class _StringsScannedEn {
	_StringsScannedEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Scanned';
}

// Path: scanner
class _StringsScannerEn {
	_StringsScannerEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Scanner';
}

// Path: services
class _StringsServicesEn {
	_StringsServicesEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get label => 'Services';
	String get tab_exercise => 'Exercise';
	String get tab_building => 'Buildings';
	String get new_category => 'New category';
	String get new_building => 'new buildings';
	String get edit => 'Edit';
	String get download => 'Download';
}

// Path: <root>
class _StringsRu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCalculatorRu calculator = _StringsCalculatorRu._(_root);
	@override late final _StringsCalendarRu calendar = _StringsCalendarRu._(_root);
	@override late final _StringsDashboardRu dashboard = _StringsDashboardRu._(_root);
	@override late final _StringsPeopleRu people = _StringsPeopleRu._(_root);
	@override late final _StringsScannedRu scanned = _StringsScannedRu._(_root);
	@override late final _StringsScannerRu scanner = _StringsScannerRu._(_root);
	@override late final _StringsServicesRu services = _StringsServicesRu._(_root);
}

// Path: calculator
class _StringsCalculatorRu implements _StringsCalculatorEn {
	_StringsCalculatorRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Калькулятор';
}

// Path: calendar
class _StringsCalendarRu implements _StringsCalendarEn {
	_StringsCalendarRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Каледарь';
}

// Path: dashboard
class _StringsDashboardRu implements _StringsDashboardEn {
	_StringsDashboardRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Панель управления';
}

// Path: people
class _StringsPeopleRu implements _StringsPeopleEn {
	_StringsPeopleRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Люди';
	@override String get tab_visitor => 'Посетители';
	@override String get tab_trainer => 'Тренера';
	@override String get tab_staff => 'Сотрудники';
	@override String get sort => 'Сортровка';
	@override String get filter => 'Фильтры';
	@override String get download => 'Скачать';
	@override String get column_fullname => 'ФИО';
	@override String get column_sex => 'Пол';
	@override String get column_birthdate => 'Дата рождения';
	@override String get column_status => 'Статус';
	@override String get column_phone_number => 'Номер телефона';
	@override String get column_last_visit => 'Последнее посещение';
	@override String get column_profile => 'Профиль';
}

// Path: scanned
class _StringsScannedRu implements _StringsScannedEn {
	_StringsScannedRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Отсканированно';
}

// Path: scanner
class _StringsScannerRu implements _StringsScannerEn {
	_StringsScannerRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Сканнер';
}

// Path: services
class _StringsServicesRu implements _StringsServicesEn {
	_StringsServicesRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Услуги';
	@override String get tab_exercise => 'Занятия';
	@override String get tab_building => 'Корпуса';
	@override String get new_category => 'Новая категория';
	@override String get new_building => 'Новый корпус';
	@override String get edit => 'Редактирвоать';
	@override String get download => 'Скачтаь';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'calculator.label': return 'Calculator';
			case 'calendar.label': return 'Calendar';
			case 'dashboard.label': return 'Dashboard';
			case 'people.label': return 'People';
			case 'people.tab_visitor': return 'Visiotrs';
			case 'people.tab_trainer': return 'Trainers';
			case 'people.tab_staff': return 'Staff';
			case 'people.sort': return 'Sort';
			case 'people.filter': return 'Filter';
			case 'people.download': return 'Download';
			case 'people.column_fullname': return 'Fullname';
			case 'people.column_sex': return 'Sex';
			case 'people.column_birthdate': return 'Birthdate';
			case 'people.column_status': return 'Status';
			case 'people.column_phone_number': return 'Phone number';
			case 'people.column_last_visit': return 'Last visit';
			case 'people.column_profile': return 'Profile';
			case 'scanned.label': return 'Scanned';
			case 'scanner.label': return 'Scanner';
			case 'services.label': return 'Services';
			case 'services.tab_exercise': return 'Exercise';
			case 'services.tab_building': return 'Buildings';
			case 'services.new_category': return 'New category';
			case 'services.new_building': return 'new buildings';
			case 'services.edit': return 'Edit';
			case 'services.download': return 'Download';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'calculator.label': return 'Калькулятор';
			case 'calendar.label': return 'Каледарь';
			case 'dashboard.label': return 'Панель управления';
			case 'people.label': return 'Люди';
			case 'people.tab_visitor': return 'Посетители';
			case 'people.tab_trainer': return 'Тренера';
			case 'people.tab_staff': return 'Сотрудники';
			case 'people.sort': return 'Сортровка';
			case 'people.filter': return 'Фильтры';
			case 'people.download': return 'Скачать';
			case 'people.column_fullname': return 'ФИО';
			case 'people.column_sex': return 'Пол';
			case 'people.column_birthdate': return 'Дата рождения';
			case 'people.column_status': return 'Статус';
			case 'people.column_phone_number': return 'Номер телефона';
			case 'people.column_last_visit': return 'Последнее посещение';
			case 'people.column_profile': return 'Профиль';
			case 'scanned.label': return 'Отсканированно';
			case 'scanner.label': return 'Сканнер';
			case 'services.label': return 'Услуги';
			case 'services.tab_exercise': return 'Занятия';
			case 'services.tab_building': return 'Корпуса';
			case 'services.new_category': return 'Новая категория';
			case 'services.new_building': return 'Новый корпус';
			case 'services.edit': return 'Редактирвоать';
			case 'services.download': return 'Скачтаь';
			default: return null;
		}
	}
}
