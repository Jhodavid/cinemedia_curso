import 'dart:ui';

import 'package:cinemedia/config/location/cinemedia_localizations_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:cinemedia/config/router/app_router.dart';
import 'package:cinemedia/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String language = 'en';

Future<void> main() async {

  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();

  language = window.locale.languageCode;
  await const CinemediaLocalizationsDelegate().load(Locale(language));

  runApp(
    const ProviderScope(
      child: MyApp()
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        CinemediaLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale.fromSubtags(languageCode: 'zh')
      ],
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
    );
  }
}