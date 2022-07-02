import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'utils/app_configuration.dart';

enum AppEnvironment { DEVELOPMENT, PRODUCTION, QA, STAGING }
enum Flavor { BASE }

class BaseApp {
  static Future<void> initialize(
      {required onGenerateRoute,
      required supportedLocales,
      required AppEnvironment environment,
      required Flavor flavor,
      required Locale startingLocale,
      required String baseUrl,
      required VoidCallback onLogout,
      required String currency,
      Widget? logoWidget,
      required isGuestFlowEnabled,
      required String title,
      required String apiKey}) async {
    final App app = App();
    AppConfiguration().init(
        environment: environment,
        flavor: flavor,
        baseUrl: baseUrl,
        onLogout: onLogout,
        supportedLocals: supportedLocales,
        isGuestFlowEnabled: isGuestFlowEnabled,
        currency: currency,
        apiKey: apiKey);

    unawaited(
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

    // Pass all uncaught errors from the framework to Crashlytics.
    runZonedGuarded(() => runApp(const ProviderScope(child: App())),
        (error, stackTrace) {
      print(error.toString());
      print(stackTrace.toString());
    });
  }
}
