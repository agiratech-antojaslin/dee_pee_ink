import 'dart:async';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_app.dart';

class AppPreferences {
  AppPreferences._();

  static const _currentEnvironment = "current_environment";
  static const _loginStatus = "login_status";
  static const _guestFlowStatus = "guest_flow_status";
  static const _token = "token";
  static const _mobileNumber = "mobile_number";
  static const _password = "password";
  static const _userName = "username";
  static const _email = "email";
  static const _quoteId = "quote_id";
  static const _cartCount = "cart_count";
  static const _billingID = "billing_id";
  static const _orderID = "order_id";

  static Future<void> setLoginStatus(bool loginStatus) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setBool(_loginStatus, loginStatus));
  }

  static Future<bool> getLoginStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    bool? loginStatus = localStorage.getBool(_loginStatus);
    return loginStatus ?? false;
  }

  static Future<void> setAuthenticationToken(String data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_token, data));
  }

  static Future<String> getAuthenticationToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString(_token);
    return token ?? "";
  }

  static Future<void> setUserName(String username) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_userName, username));
  }

  static Future<String> geUserName() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? id = localStorage.getString(_userName);
    return id ?? "";
  }

  static Future<void> setMobileNumber(String mobileNumber) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_mobileNumber, mobileNumber));
  }

  static Future<String> getMobileNumber() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? id = localStorage.getString(_mobileNumber);
    return id ?? "";
  }

  static Future<void> setPassword(String data) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_password, data));
  }

  static Future<String> getPassword() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? id = localStorage.getString(_password);
    return id ?? "";
  }

  static Future<void> setGuestFlowStatus(bool guestFlowStatus) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setBool(_guestFlowStatus, guestFlowStatus));
  }

  static Future<bool> getGuestFlowStatus() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    bool? guestFlowStatus = localStorage.getBool(_guestFlowStatus);
    return guestFlowStatus ?? false;
  }

  static Future<void> setEmail(String username) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_email, username));
  }

  static Future<String> geEmail() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? id = localStorage.getString(_email);
    return id ?? "";
  }

  static Future<void> logoutClearPreferences() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    await localStorage.remove(_loginStatus);
    await localStorage.remove(_token);
    String? password = localStorage.getString(_password);
    if (password!.isEmpty) {
      await localStorage.remove(_mobileNumber);
    }
    await clearSecurelyStoredPreferences();
  }

  static Future<void> clearSecurelyStoredPreferences() async {
    final secureStorage = FlutterSecureStorage();
    await secureStorage.deleteAll();
  }

  static Future<void> setCurrentEnvironment(
      AppEnvironment currentEnvironment) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(
        _currentEnvironment, EnumToString.parse(currentEnvironment)));
  }

  static Future<AppEnvironment?> getCurrentEnvironment() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? currentEnvironmentString =
        localStorage.getString(_currentEnvironment);
    if (currentEnvironmentString != null &&
        currentEnvironmentString.isNotEmpty) {
      return EnumToString.fromString(
          AppEnvironment.values, currentEnvironmentString);
    }
    // throw null;
    return null;
  }

  static Future<String> getCurQuoteId() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? getCurQuoteId = localStorage.getString(_quoteId);
    return getCurQuoteId ?? "";
  }

  static Future<void> setCurQuoteId(String quoteId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_quoteId, quoteId));
  }

  static Future<String> getCartCount() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? getCartCount = localStorage.getString(_cartCount);
    return getCartCount ?? "";
  }

  static Future<void> setCartCount(String cartCount) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_cartCount, cartCount));
  }

  static Future<String> getCurBillingAddress() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? getCurBillingAddress = localStorage.getString(_billingID);
    return getCurBillingAddress ?? "";
  }

  static Future<void> setCurBillingAddress(String addId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_billingID, addId));
  }

  static Future<String> getCurOrderId() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? getCurOrderId = localStorage.getString(_orderID);
    return getCurOrderId ?? "";
  }

  static Future<void> setCurOrderId(String orderId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    unawaited(localStorage.setString(_orderID, orderId));
  }
}
