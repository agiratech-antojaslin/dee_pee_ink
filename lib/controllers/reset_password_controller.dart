import 'package:dee_pee_ink/model/new_password_model.dart';
import 'package:dee_pee_ink/model/new_password_response.dart';
import 'package:flutter/material.dart';

import '../repositories/authentication_repository.dart';
import '../utils/app_configuration.dart';
import '../utils/app_preferences.dart';

class ResetPasswordController with ChangeNotifier {
  final TextEditingController _mobileNumberController = TextEditingController();

  TextEditingController get mobileNumberController => _mobileNumberController;

  final TextEditingController _otpNumberController = TextEditingController();

  TextEditingController get otpNumberController => _otpNumberController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  bool _updateValue = false;

  bool get isButtonEnabled => _updateValue;

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<bool> callNewPasswordApi() async {
    ResetPasswordModel resetPasswordModel = ResetPasswordModel(
      user: User(
          mobileNumber: _mobileNumberController.text.trim(),
          password: _passwordController.text,
          passwordConfirmation: _confirmPasswordController.text,
          forgotOtp: _otpNumberController.text),
    );

    ResetPasswordResponse? response = await _authenticationRepository
        .postResetPasswordRequest(_context, resetPasswordModel);

    if (response != null) {
      await AppPreferences.setMobileNumber(_mobileNumberController.text.trim());
      AppConfiguration().setUserIsLoggedIn();
      print('Authorization Token' +
          AppPreferences.getAuthenticationToken().toString());
      return true;
    } else {
      return false;
    }
  }

  late BuildContext _context;

  void init(BuildContext context) {
    _context = context;
    _mobileNumberController.addListener(() {
      _validateValues();
    });
    _passwordController.addListener(() {
      _validateValues();
    });
    _confirmPasswordController.addListener(() {
      _validateValues();
    });
    _otpNumberController.addListener(() {
      _validateValues();
    });
  }

  _validateValues() {
    _updateValue = _mobileNumberController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _otpNumberController.text.isNotEmpty;
    notifyListeners();
  }
}
