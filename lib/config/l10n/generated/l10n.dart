// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:try_ricki_2/config/l10n/generated/intl/messages_all.dart';
// import 'package:try_ricki_2/l10n/generated/intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Language {
  Language();

  static Language? _current;

  static Language get current {
    assert(_current != null,
        'No instance of Language was loaded. Try to initialize the Language delegate before accessing Language.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Language> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Language();
      Language._current = instance;

      return instance;
    });
  }

  static Language of(BuildContext context) {
    final instance = Language.maybeOf(context);
    assert(instance != null,
        'No instance of Language present in the widget tree. Did you add Language.delegate in localizationsDelegates?');
    return instance!;
  }

  static Language? maybeOf(BuildContext context) {
    return Localizations.of<Language>(context, Language);
  }

  /// `Найти персонажа`
  String get searchCharacter {
    return Intl.message(
      'Найти персонажа',
      name: 'searchCharacter',
      desc: '',
      args: [],
    );
  }

  /// `Всего персонажей:`
  String get allCharacters {
    return Intl.message(
      'Всего персонажей:',
      name: 'allCharacters',
      desc: '',
      args: [],
    );
  }

  /// `Персонажи`
  String get characters {
    return Intl.message(
      'Персонажи',
      name: 'characters',
      desc: '',
      args: [],
    );
  }

  /// `Локациии`
  String get location {
    return Intl.message(
      'Локациии',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Эпизоды`
  String get episodes {
    return Intl.message(
      'Эпизоды',
      name: 'episodes',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Пол`
  String get gender {
    return Intl.message(
      'Пол',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Расса`
  String get race {
    return Intl.message(
      'Расса',
      name: 'race',
      desc: '',
      args: [],
    );
  }

  /// `Человек`
  String get human {
    return Intl.message(
      'Человек',
      name: 'human',
      desc: '',
      args: [],
    );
  }

  /// `Место рождения`
  String get placeOfBirth {
    return Intl.message(
      'Место рождения',
      name: 'placeOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Темная тема`
  String get darkTheme {
    return Intl.message(
      'Темная тема',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Внешний вид`
  String get appearance {
    return Intl.message(
      'Внешний вид',
      name: 'appearance',
      desc: '',
      args: [],
    );
  }

  /// `О приложении`
  String get aboutTheApplication {
    return Intl.message(
      'О приложении',
      name: 'aboutTheApplication',
      desc: '',
      args: [],
    );
  }

  /// `Версия приложения`
  String get applicationVersion {
    return Intl.message(
      'Версия приложения',
      name: 'applicationVersion',
      desc: '',
      args: [],
    );
  }

  /// `Включена`
  String get enabled {
    return Intl.message(
      'Включена',
      name: 'enabled',
      desc: '',
      args: [],
    );
  }

  /// `Выключена`
  String get off {
    return Intl.message(
      'Выключена',
      name: 'off',
      desc: '',
      args: [],
    );
  }

  /// `Следовать настройкам системы`
  String get followSystemSettings {
    return Intl.message(
      'Следовать настройкам системы',
      name: 'followSystemSettings',
      desc: '',
      args: [],
    );
  }

  /// `В режиме энергосбережения`
  String get inPowerSavingMode {
    return Intl.message(
      'В режиме энергосбережения',
      name: 'inPowerSavingMode',
      desc: '',
      args: [],
    );
  }

  /// `Отмена`
  String get cancel {
    return Intl.message(
      'Отмена',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать профиль`
  String get editProfile {
    return Intl.message(
      'Редактировать профиль',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Изменить фото`
  String get editPhoto {
    return Intl.message(
      'Изменить фото',
      name: 'editPhoto',
      desc: '',
      args: [],
    );
  }

  /// `профиль`
  String get profile {
    return Intl.message(
      'профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Изменить ФИО`
  String get changeFullName {
    return Intl.message(
      'Изменить ФИО',
      name: 'changeFullName',
      desc: '',
      args: [],
    );
  }

  /// `Логин`
  String get login {
    return Intl.message(
      'Логин',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Имя`
  String get name {
    return Intl.message(
      'Имя',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Фамилия`
  String get surname {
    return Intl.message(
      'Фамилия',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Отчество`
  String get patronymic {
    return Intl.message(
      'Отчество',
      name: 'patronymic',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Фильтры`
  String get filters {
    return Intl.message(
      'Фильтры',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Сортировать`
  String get sort {
    return Intl.message(
      'Сортировать',
      name: 'sort',
      desc: '',
      args: [],
    );
  }

  /// `По алфавиту`
  String get alphabetically {
    return Intl.message(
      'По алфавиту',
      name: 'alphabetically',
      desc: '',
      args: [],
    );
  }

  /// `Живой`
  String get alive {
    return Intl.message(
      'Живой',
      name: 'alive',
      desc: '',
      args: [],
    );
  }

  /// `Мертвый`
  String get dead {
    return Intl.message(
      'Мертвый',
      name: 'dead',
      desc: '',
      args: [],
    );
  }

  /// `Неизвестно`
  String get unknown {
    return Intl.message(
      'Неизвестно',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Мужской`
  String get male {
    return Intl.message(
      'Мужской',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Женский`
  String get female {
    return Intl.message(
      'Женский',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Бесполый`
  String get neutral {
    return Intl.message(
      'Бесполый',
      name: 'neutral',
      desc: '',
      args: [],
    );
  }

  /// `Языки`
  String get languages {
    return Intl.message(
      'Языки',
      name: 'languages',
      desc: '',
      args: [],
    );
  }

  /// `Выбор Языка`
  String get choiceLanguage {
    return Intl.message(
      'Выбор Языка',
      name: 'choiceLanguage',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Language> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ky'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Language> load(Locale locale) => Language.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
