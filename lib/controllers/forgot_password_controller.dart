import 'package:dee_pee_ink/model/forgot_password_model.dart';
import 'package:dee_pee_ink/model/forgot_password_response.dart';
import 'package:flutter/material.dart';

import '../repositories/authentication_repository.dart';
import '../utils/app_configuration.dart';
import '../utils/app_preferences.dart';

class ForgotPasswordController with ChangeNotifier {
  final TextEditingController _mobileNumberController = TextEditingController();

  TextEditingController get mobileNumberController => _mobileNumberController;

  bool _updateValue = false;

  bool get isButtonEnabled => _updateValue;

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<bool> callForgotPasswordApi() async {
    ForgotPasswordModel forgotPasswordModel = ForgotPasswordModel(
      user: User(
        mobileNumber: _mobileNumberController.text.trim(),
      ),
    );

    ForgotPasswordResponse? response = await _authenticationRepository
        .postForgotPasswordRequest(_context, forgotPasswordModel);

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
  }

  _validateValues() {
    _updateValue = _mobileNumberController.text
        .isNotEmpty; /*ValidationUtils.isEmail(_userEmailController.text.trim())*/
    notifyListeners();
  }
}
