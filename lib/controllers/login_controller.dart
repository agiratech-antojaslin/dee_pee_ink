import 'package:flutter/material.dart';

import '../model/login_model.dart';
import '../model/login_response.dart';
import '../repositories/authentication_repository.dart';
import '../utils/app_configuration.dart';
import '../utils/app_preferences.dart';

class LogInController with ChangeNotifier {
  final TextEditingController _mobileNumberController = TextEditingController();

  TextEditingController get mobileNumberController => _mobileNumberController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final FocusNode _emailInputFocusNode = FocusNode();
  final FocusNode _passwordInputFocusNode = FocusNode();

  FocusNode get emailInputFocusNode => _emailInputFocusNode;

  FocusNode get passwordInputFocusNode => _passwordInputFocusNode;

  bool _updateValue = false;

  bool get isButtonEnabled => _updateValue;

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<bool> callSignInApi() async {
    LoginModel loginModel = LoginModel(
      user: User(
          mobileNumber: _mobileNumberController.text.trim(),
          password: _passwordController.text.trim()),
    );

    LoginResponseData? response =
        await _authenticationRepository.postSignInRequest(_context, loginModel);

    if (response != null) {
      await AppPreferences.setAuthenticationToken(
          response.data?.authenticationToken.toString() as String);
      await AppPreferences.setMobileNumber(_mobileNumberController.text.trim());
      if (_isRememberMe) {
        await AppPreferences.setPassword(_passwordController.text.trim());
      } else {
        await AppPreferences.setPassword("");
      }
      AppConfiguration().setUserIsLoggedIn();
      print('Authorization Token' +
          AppPreferences.getAuthenticationToken().toString());
      return true;
    } else {
      return false;
    }
  }

  bool _isVisible = true;

  bool get isVisible => _isVisible;

  bool _isRememberMe = false;

  bool get isRememberMe => _isRememberMe;

  void updateRememberMe(bool? data) {
    _isRememberMe = data!;
    notifyListeners();
  }

  late BuildContext _context;

  void init(BuildContext context) async {
    _context = context;

    _mobileNumberController.addListener(() {
      _validateValues();
    });
    _passwordController.addListener(() {
      _validateValues();
    });
    String password = await AppPreferences.getPassword();
    String mobileNo = await AppPreferences.getMobileNumber();
    if (password.isNotEmpty) {
      _passwordController.text = password;
      _mobileNumberController.text = mobileNo;
    }
  }

  _validateValues() {
    _updateValue = _mobileNumberController.text
            .isNotEmpty /*ValidationUtils.isEmail(_userEmailController.text.trim())*/ &&
        _passwordController.text.isNotEmpty;
    notifyListeners();
  }

  void updateVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
