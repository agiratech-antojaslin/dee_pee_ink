import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../constants/languages.dart';
import '../locale/app_localization.dart';
import '../routing/routes.dart' as routess;
import '../themes/app_theme.dart';
import 'routing/route_constants.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
      localizationsDelegates: const [
        //Custom App delegates
        AppLocalizations.delegate,
        // material delegates
        GlobalMaterialLocalizations.delegate,
        // Any type of Widget in Locale
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: AppTheme.lightTheme,
      initialRoute: RouteConstants.initial,
      onGenerateRoute: routess.onGenerateRoute,
      // home: HomeScreen(),
    );
  }
}
