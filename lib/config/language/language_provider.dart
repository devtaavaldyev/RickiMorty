import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:try_ricki_2/service_locator.dart';

enum LanguageEnum {
  ky(title: 'Кыргызча'),
  ru(title: 'Русский'),
  en(title: 'English');

  final String title;
  const LanguageEnum({required this.title});
}

class LanguageProvider with ChangeNotifier {
  LanguageProvider() {
    initialization();
  }
  Locale currentLocale = const Locale('en');

  void initialization() {
    final savedLang = sl<SharedPreferences>().getString('language') ?? '';

    switch (savedLang) {
      case 'en':
        currentLocale = const Locale('en');
        break;
      case 'ru':
        currentLocale = const Locale('ru');
        break;
      default:
        currentLocale = const Locale('ky');
        break;
    }
  }

  void changeLanguage(LanguageEnum lang) {
    switch (lang) {
      case LanguageEnum.en:
        sl<SharedPreferences>().setString('language', lang.name);
        currentLocale = const Locale('en');
        break;
      case LanguageEnum.ru:
        sl<SharedPreferences>().setString('language', lang.name);
        currentLocale = const Locale('ru');

        break;
      default:
        sl<SharedPreferences>().setString('language', lang.name);
        currentLocale = const Locale('ky');
    }

    notifyListeners();
  }
}
