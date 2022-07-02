import 'package:dee_pee_ink/routing/routes.dart' as routes;
import 'package:dee_pee_ink/utils/api_config.dart';
import 'package:dee_pee_ink/utils/app_constants.dart';
import 'package:flutter/material.dart';

import 'base_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Unawawited performs async function.
  //unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

  // Any SingleTon Initialization Comes Here.
  BaseApp.initialize(
      onGenerateRoute: routes.onGenerateRoute,
      //routes.onGenerateRoute,
      environment: AppEnvironment.DEVELOPMENT,
      flavor: Flavor.BASE,
      supportedLocales: AppConstants.supportedLocals,
      baseUrl: ApiConfig.baseUrl,
      isGuestFlowEnabled: true,
      logoWidget: Container(),
      title: "PA - Admin",
      startingLocale: Locale("en", "EN"),
      currency: '',
      onLogout: () {},
      apiKey: '');
}
