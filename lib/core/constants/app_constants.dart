import 'package:flutter/material.dart';

class ApplicationConstants {
  ApplicationConstants._();
  static final ApplicationConstants _instance = ApplicationConstants._();
  static ApplicationConstants get instance => _instance;

  final String _baseURL = "https://dummyjson.com";
  final fontFamily = "TTNormsPro";
  static const _locale = Locale('tr', 'TR');
  static const _fallbackLocale = Locale('en', 'US');
  static const List<Locale> _supportedLocales = [_locale, _fallbackLocale];

  String get baseURL => _baseURL;
  Locale get locale => _locale;
  Locale get fallbackLocale => _fallbackLocale;
  List<Locale> get supportedLocales => _supportedLocales;
}
