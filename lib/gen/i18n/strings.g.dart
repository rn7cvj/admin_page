/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 116 (58 per locale)
///
/// Built on 2024-02-04 at 21:14 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
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
Translations get t => LocaleSettings.instance.currentTranslations;

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
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
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
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
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
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsAuthEn auth = _StringsAuthEn._(_root);
	late final _StringsBuildingEn building = _StringsBuildingEn._(_root);
	late final _StringsCalculatorEn calculator = _StringsCalculatorEn._(_root);
	late final _StringsCalendarEn calendar = _StringsCalendarEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsDashboardEn dashboard = _StringsDashboardEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsPeopleEn people = _StringsPeopleEn._(_root);
	late final _StringsScannedEn scanned = _StringsScannedEn._(_root);
	late final _StringsScannerEn scanner = _StringsScannerEn._(_root);
	late final _StringsServicesEn services = _StringsServicesEn._(_root);
	late final _StringsUserpageEn userpage = _StringsUserpageEn._(_root);
}

// Path: auth
class _StringsAuthEn {
	_StringsAuthEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get emailHint => 'Email or phone number';
	String get emailRequired => 'Email is required';
	String get emailInvalid => 'Invalid email';
	String get passwordHint => 'Password';
	String get passwordRequired => 'Password is required';
	String get passwordTooShort => 'Password should be at least 6 characters long';
	String get forgotPassword => 'Forgot password?';
	String get login => 'Login';
	String get restorePassword => 'Restore password';
	String get restorePasswordHint => 'Enter your email address and we will send you a link to reset your password';
	String get sendRestoreLink => 'Send restore link';
	String get newtworkTroubleMessage => 'Network trouble';
	String get serverInaccessibleMessage => 'Server is inaccessible';
	String get wrongDataMessage => 'Wrong email or password';
	String get expiredTokenMessage => 'Your session has expired, please login again';
}

// Path: building
class _StringsBuildingEn {
	_StringsBuildingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Building';
}

// Path: calculator
class _StringsCalculatorEn {
	_StringsCalculatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Calculator';
}

// Path: calendar
class _StringsCalendarEn {
	_StringsCalendarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Calendar';
	String get new_event => 'New event';
	String get edit => 'Edit';
	String get download => 'Download';
	String get event_column_name => 'Event name';
	String get event_column_begin => 'Begin';
	String get event_column_end => 'End';
	String get event_column_building => 'Building';
	String get event_column_area => 'Area';
	String get event_column_total_spaces => 'Total spaces';
	String get event_column_occupied_spaces => 'Occupied spaces';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get loading => 'Loading...';
	String get error => 'Error :(';
}

// Path: dashboard
class _StringsDashboardEn {
	_StringsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Dashboard';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get welcome => 'Good afternoon';
}

// Path: people
class _StringsPeopleEn {
	_StringsPeopleEn._(this._root);

	final Translations _root; // ignore: unused_field

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

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Scanned';
	String get qr_invalid => 'This qr is invalid';
	String get back_to_camera => 'Back to camera';
}

// Path: scanner
class _StringsScannerEn {
	_StringsScannerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Scanner';
}

// Path: services
class _StringsServicesEn {
	_StringsServicesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Services';
	String get tab_exercise => 'Exercise';
	String get tab_building => 'Buildings';
	String get new_category => 'New category';
	String get new_building => 'new buildings';
	String get edit => 'Edit';
	String get download => 'Download';
}

// Path: userpage
class _StringsUserpageEn {
	_StringsUserpageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'User page';
}

// Path: <root>
class _StringsRu implements Translations {
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
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsAuthRu auth = _StringsAuthRu._(_root);
	@override late final _StringsBuildingRu building = _StringsBuildingRu._(_root);
	@override late final _StringsCalculatorRu calculator = _StringsCalculatorRu._(_root);
	@override late final _StringsCalendarRu calendar = _StringsCalendarRu._(_root);
	@override late final _StringsCommonRu common = _StringsCommonRu._(_root);
	@override late final _StringsDashboardRu dashboard = _StringsDashboardRu._(_root);
	@override late final _StringsHomeRu home = _StringsHomeRu._(_root);
	@override late final _StringsPeopleRu people = _StringsPeopleRu._(_root);
	@override late final _StringsScannedRu scanned = _StringsScannedRu._(_root);
	@override late final _StringsScannerRu scanner = _StringsScannerRu._(_root);
	@override late final _StringsServicesRu services = _StringsServicesRu._(_root);
	@override late final _StringsUserpageRu userpage = _StringsUserpageRu._(_root);
}

// Path: auth
class _StringsAuthRu implements _StringsAuthEn {
	_StringsAuthRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get emailHint => 'Email или номер телефона';
	@override String get emailRequired => 'Email обязателен';
	@override String get emailInvalid => 'Неверный email';
	@override String get passwordHint => 'Пароль';
	@override String get passwordRequired => 'Пароль обязателен';
	@override String get passwordTooShort => 'Пароль должен быть не менее 6 символов';
	@override String get forgotPassword => 'Забыли пароль?';
	@override String get login => 'Войти';
	@override String get restorePassword => 'Восстановление пароля';
	@override String get restorePasswordHint => 'Введите адрес электронной почты и мы отправим вам ссылку для сброса пароля';
	@override String get sendRestoreLink => 'Отправить ссылку';
	@override String get newtworkTroubleMessage => 'Проблемы с сетью';
	@override String get serverInaccessibleMessage => 'Сервис временно недоступен';
	@override String get wrongDataMessage => 'Неверный email или пароль';
	@override String get expiredTokenMessage => 'Ваша сессия истекла, пожалуйста, войдите снова';
}

// Path: building
class _StringsBuildingRu implements _StringsBuildingEn {
	_StringsBuildingRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Корпус';
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
	@override String get new_event => 'Новое занятие';
	@override String get edit => 'Изменить';
	@override String get download => 'Скачать';
	@override String get event_column_name => 'Название';
	@override String get event_column_begin => 'Начало';
	@override String get event_column_end => 'Конец';
	@override String get event_column_building => 'Здание';
	@override String get event_column_area => 'Зона';
	@override String get event_column_total_spaces => 'Всего мест';
	@override String get event_column_occupied_spaces => 'Занято мест';
}

// Path: common
class _StringsCommonRu implements _StringsCommonEn {
	_StringsCommonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get loading => 'Загрузка...';
	@override String get error => 'Ошибка :(';
}

// Path: dashboard
class _StringsDashboardRu implements _StringsDashboardEn {
	_StringsDashboardRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Панель управления';
}

// Path: home
class _StringsHomeRu implements _StringsHomeEn {
	_StringsHomeRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get welcome => 'Добрый день';
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
	@override String get qr_invalid => 'Данный QR не действителен';
	@override String get back_to_camera => 'назад к камере';
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

// Path: userpage
class _StringsUserpageRu implements _StringsUserpageEn {
	_StringsUserpageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get label => 'Странница пользователя';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.emailHint': return 'Email or phone number';
			case 'auth.emailRequired': return 'Email is required';
			case 'auth.emailInvalid': return 'Invalid email';
			case 'auth.passwordHint': return 'Password';
			case 'auth.passwordRequired': return 'Password is required';
			case 'auth.passwordTooShort': return 'Password should be at least 6 characters long';
			case 'auth.forgotPassword': return 'Forgot password?';
			case 'auth.login': return 'Login';
			case 'auth.restorePassword': return 'Restore password';
			case 'auth.restorePasswordHint': return 'Enter your email address and we will send you a link to reset your password';
			case 'auth.sendRestoreLink': return 'Send restore link';
			case 'auth.newtworkTroubleMessage': return 'Network trouble';
			case 'auth.serverInaccessibleMessage': return 'Server is inaccessible';
			case 'auth.wrongDataMessage': return 'Wrong email or password';
			case 'auth.expiredTokenMessage': return 'Your session has expired, please login again';
			case 'building.label': return 'Building';
			case 'calculator.label': return 'Calculator';
			case 'calendar.label': return 'Calendar';
			case 'calendar.new_event': return 'New event';
			case 'calendar.edit': return 'Edit';
			case 'calendar.download': return 'Download';
			case 'calendar.event_column_name': return 'Event name';
			case 'calendar.event_column_begin': return 'Begin';
			case 'calendar.event_column_end': return 'End';
			case 'calendar.event_column_building': return 'Building';
			case 'calendar.event_column_area': return 'Area';
			case 'calendar.event_column_total_spaces': return 'Total spaces';
			case 'calendar.event_column_occupied_spaces': return 'Occupied spaces';
			case 'common.loading': return 'Loading...';
			case 'common.error': return 'Error :(';
			case 'dashboard.label': return 'Dashboard';
			case 'home.welcome': return 'Good afternoon';
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
			case 'scanned.qr_invalid': return 'This qr is invalid';
			case 'scanned.back_to_camera': return 'Back to camera';
			case 'scanner.label': return 'Scanner';
			case 'services.label': return 'Services';
			case 'services.tab_exercise': return 'Exercise';
			case 'services.tab_building': return 'Buildings';
			case 'services.new_category': return 'New category';
			case 'services.new_building': return 'new buildings';
			case 'services.edit': return 'Edit';
			case 'services.download': return 'Download';
			case 'userpage.label': return 'User page';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'auth.emailHint': return 'Email или номер телефона';
			case 'auth.emailRequired': return 'Email обязателен';
			case 'auth.emailInvalid': return 'Неверный email';
			case 'auth.passwordHint': return 'Пароль';
			case 'auth.passwordRequired': return 'Пароль обязателен';
			case 'auth.passwordTooShort': return 'Пароль должен быть не менее 6 символов';
			case 'auth.forgotPassword': return 'Забыли пароль?';
			case 'auth.login': return 'Войти';
			case 'auth.restorePassword': return 'Восстановление пароля';
			case 'auth.restorePasswordHint': return 'Введите адрес электронной почты и мы отправим вам ссылку для сброса пароля';
			case 'auth.sendRestoreLink': return 'Отправить ссылку';
			case 'auth.newtworkTroubleMessage': return 'Проблемы с сетью';
			case 'auth.serverInaccessibleMessage': return 'Сервис временно недоступен';
			case 'auth.wrongDataMessage': return 'Неверный email или пароль';
			case 'auth.expiredTokenMessage': return 'Ваша сессия истекла, пожалуйста, войдите снова';
			case 'building.label': return 'Корпус';
			case 'calculator.label': return 'Калькулятор';
			case 'calendar.label': return 'Каледарь';
			case 'calendar.new_event': return 'Новое занятие';
			case 'calendar.edit': return 'Изменить';
			case 'calendar.download': return 'Скачать';
			case 'calendar.event_column_name': return 'Название';
			case 'calendar.event_column_begin': return 'Начало';
			case 'calendar.event_column_end': return 'Конец';
			case 'calendar.event_column_building': return 'Здание';
			case 'calendar.event_column_area': return 'Зона';
			case 'calendar.event_column_total_spaces': return 'Всего мест';
			case 'calendar.event_column_occupied_spaces': return 'Занято мест';
			case 'common.loading': return 'Загрузка...';
			case 'common.error': return 'Ошибка :(';
			case 'dashboard.label': return 'Панель управления';
			case 'home.welcome': return 'Добрый день';
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
			case 'scanned.qr_invalid': return 'Данный QR не действителен';
			case 'scanned.back_to_camera': return 'назад к камере';
			case 'scanner.label': return 'Сканнер';
			case 'services.label': return 'Услуги';
			case 'services.tab_exercise': return 'Занятия';
			case 'services.tab_building': return 'Корпуса';
			case 'services.new_category': return 'Новая категория';
			case 'services.new_building': return 'Новый корпус';
			case 'services.edit': return 'Редактирвоать';
			case 'services.download': return 'Скачтаь';
			case 'userpage.label': return 'Странница пользователя';
			default: return null;
		}
	}
}
