import 'package:flutter/material.dart';

import '../base_app.dart';
import 'app_preferences.dart';

class AppConfiguration {
  static final AppConfiguration _instance = AppConfiguration._internal();

  AppConfiguration._internal();

  factory AppConfiguration() => _instance;

  String? _appName;
  bool _loginStatus = false;
  AppEnvironment? _environment;
  Flavor? _flavor;
  String? _baseUrl;
  List<Locale>? _supportedLocals;
  Locale? _currentLocale;
  bool? _isGuestFlowEnabled;
  String? _apiKey;

  Future<void> init(
      {required AppEnvironment environment,
      required Flavor flavor,
      required String baseUrl,
      required onLogout,
      required currency,
      required isGuestFlowEnabled,
      required supportedLocals,
      required apiKey}) async {
    assert(baseUrl != null);
    _baseUrl = baseUrl;
    _environment = environment;
    _flavor = flavor;
    _onLogout = onLogout;
    _isGuestFlowEnabled = isGuestFlowEnabled;
    _supportedLocals = supportedLocals;
    _apiKey = apiKey;
    await readPropertiesFromPreferences();
  }

  Future<void> readPropertiesFromPreferences() async {
    _loginStatus = await AppPreferences.getLoginStatus();
    print(_loginStatus);
  }

  VoidCallback? _onLogout;

  String? get apiKey => _apiKey;

  String? get appName => _appName;

  Function? get onLogout => _onLogout;

  bool get isUserLoggedIn => _loginStatus;

  AppEnvironment? get currentEnvironment => _environment;

  List<Locale>? get supportedLocals => _supportedLocals;

  Flavor? get flavor => _flavor;

  String? get flavorName => _flavor
      .toString()
      .substring(_flavor.toString().indexOf('.') + 1)
      .toLowerCase();

  String? get baseUrl => _baseUrl;

  String? get currentLanguage => _currentLocale?.languageCode;

  bool? get isGuestFlowEnabled => _isGuestFlowEnabled;

  Locale? get currentLocale => _currentLocale;

  void changeCurrentLocale(Locale locale) {
    assert(locale != null);
    _currentLocale = locale;
  }

  void setUserIsLoggedIn() {
    _loginStatus = true;
    AppPreferences.setLoginStatus(true);
  }

  void setIsGuestFlowEnabled() {
    _isGuestFlowEnabled = true;
    AppPreferences.setGuestFlowStatus(true);
  }

  Future<void> setUserIsLoggedOut() async {
    await AppPreferences.logoutClearPreferences();
    await readPropertiesFromPreferences();
  }
}
