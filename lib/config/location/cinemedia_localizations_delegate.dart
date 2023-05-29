
import 'dart:convert';

import 'package:cinemedia/config/location/cinemedia_lozalizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CinemediaLocalizationsDelegate extends LocalizationsDelegate<CinemediaLocalizations> {
  
  const CinemediaLocalizationsDelegate();
  
  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }
  
  @override
  Future<CinemediaLocalizations> load(Locale locale) async {
    final Map<String, dynamic> jsonMap = await rootBundle.loadStructuredData<Map<String, dynamic>>(
      'assets/languages/${locale.languageCode}.arb',
      (jsonStr) async => json.decode(jsonStr),
    );
    return CinemediaLocalizations(locale, jsonMap);
  }
  
  @override
  bool shouldReload(covariant LocalizationsDelegate<CinemediaLocalizations> old) => false;

}