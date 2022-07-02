import 'package:dee_pee_ink/model/update_password_model.dart';
import 'package:dee_pee_ink/model/update_password_response.dart';
import 'package:flutter/material.dart';

import '../repositories/authentication_repository.dart';
import '../utils/app_configuration.dart';
import '../utils/app_preferences.dart';

class ChangePasswordController with ChangeNotifier {

  final TextEditingController _currentPasswordController = TextEditingController();
  TextEditingController get currentPasswordController => _currentPasswordController;

  final TextEditingController _newPasswordController = TextEditingController();
  TextEditingController get newPasswordController => _newPasswordController;

  final TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController get confirmPasswordController => _confirmPasswordController;

  bool _isVisible = true;
  bool get isVisible => _isVisible;

  bool _isCurrentPasswordVisible = true;
  bool get isCurrentPasswordVisible => _isCurrentPasswordVisible;

  bool _isNewPasswordVisible = true;
  bool get isNewPasswordVisible => _isNewPasswordVisible;

  bool _isConfirmPasswordVisible = true;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible;

  bool _updateValue = false;

  bool get isButtonEnabled => _updateValue;

  late BuildContext _context;

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  Future<bool> callUpdatePasswordApi() async {
    UpdatePasswordModel updatePasswordModel = UpdatePasswordModel(
      user: User(
        currentPassword: _currentPasswordController.text,
        password: _newPasswordController.text,
      ),
    );

    UpdatePasswordResponse? response = await _authenticationRepository
        .patchUpdatePassword(_context, updatePasswordModel);

    if (response != null) {

      AppConfiguration().setUserIsLoggedIn();
      print('Authorization Token' +
          AppPreferences.getAuthenticationToken().toString());
      return true;
    } else {
      return false;
    }
  }

  void init(BuildContext context)async {
    _context = context;
    _newPasswordController.addListener(() {
      _validateValues();
    });
    _confirmPasswordController.addListener(() {
      _validateValues();
    });
    _currentPasswordController.addListener(() {
      _validateValues();
    });
  }

  void updateCurrentVisible() {
    _isCurrentPasswordVisible =! _isCurrentPasswordVisible;
    notifyListeners();
  }

  void updateVisibly() {
    _isNewPasswordVisible = !_isNewPasswordVisible;
    notifyListeners();
  }

  void updateVisible() {
    _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    notifyListeners();
  }

  void updateVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }

  _validateValues() {
    _updateValue = _currentPasswordController.text != _newPasswordController.text;
    //_updateValue = _newPasswordController.text != _confirmPasswordController.text;
    notifyListeners();
  }
}
