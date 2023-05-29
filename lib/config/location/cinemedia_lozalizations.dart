
import 'dart:convert';

import 'package:cinemedia/config/location/cinemedia_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CinemediaLocalizations {

  final Locale locale;
  final Map<String, dynamic> _localizedStrings;

  CinemediaLocalizations(this.locale ,this._localizedStrings);

  static Future<CinemediaLocalizations> load(Locale locale) async {
    final Map<String, dynamic> jsonMap = await rootBundle.loadStructuredData(
      'assets/language/${locale.languageCode}.arb',
      (jsonStr) async => json.decode(jsonStr)
    );
    return CinemediaLocalizations(locale ,jsonMap);
  }

  static const LocalizationsDelegate<CinemediaLocalizations> delegate = CinemediaLocalizationsDelegate();

  static CinemediaLocalizations of(BuildContext context) {
    return Localizations.of<CinemediaLocalizations>(context, CinemediaLocalizations)!;
  }

  //String instances

  String get welcomeMessage => _localizedStrings['welcomeMessage'];

  String hello(String name) => Intl.message(
        '$name says hello!',
        name: 'hello',
        args: [name],
        locale: locale.toString(),
      );

  MenuStrings get menu => MenuStrings(_localizedStrings['menu']);

  HomeMovies get home => HomeMovies(_localizedStrings['home']);

}


class MenuStrings {

  final Map<String, dynamic> _localizedStrings;

  MenuStrings(this._localizedStrings);

  String get home => _localizedStrings['home'];

  String get settings => _localizedStrings['settings'];

  String get about => _localizedStrings['about'];
}

class HomeMovies {

  final Map<String, dynamic> _localizedStrings;

  HomeMovies(this._localizedStrings);

  String get inTheatersTitle => _localizedStrings['inTheatersTitle'];

  String get inTheatersSubtitle => _localizedStrings['inTheatersSubtitle'];

  String get thisMonTitle => _localizedStrings['thisMonTitle'];

  String get polularTitle => _localizedStrings['polularTitle'];

  String get bestTitle => _localizedStrings['bestTitle'];

  String get upcomingTitle => _localizedStrings['upcomingTitle'];

  String get bestSubtitle => _localizedStrings['bestSubtitle'];
}