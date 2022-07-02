import 'package:flutter/material.dart';

import '../model/signup_response.dart';
import '../repositories/authentication_repository.dart';
import '../utils/validation_utils.dart';

class SignUpController with ChangeNotifier {
  final TextEditingController _userNameController = TextEditingController();

  TextEditingController get userNameController => _userNameController;

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _mobileNoController = TextEditingController();

  TextEditingController get mobileController => _mobileNoController;

  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get passwordController => _passwordController;

  final AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  bool _updateValue = false;

  bool get isButtonEnabled => _updateValue;

  String? _phnNumber;

  String? get phnNumber => _phnNumber;

  bool _isVisible = true;

  bool get isVisible => _isVisible;

  bool _isPasswordConfirmVisible = true;

  bool get isPasswordConfirmVisible => _isPasswordConfirmVisible;

  String errorText() {
    if (_userNameController.text.isEmpty) {
      return 'please enter user name';
    } else if (_emailController.text.isEmpty) {
      return 'please enter email address';
    } else if (_passwordController.text.isEmpty) {
      return 'please enter password';
    } else if (!ValidationUtils.isEmail(_emailController.text)) {
      return 'invalid email';
    } else if (!ValidationUtils.isValidPassword(_passwordController.text)) {
      return 'Password should contain at least 7 letters with one digit, capital letter, lower cases or special characters.';
    } else if (_mobileNoController.text.trim().isEmpty) {
      return 'please enter phone number';
    } else if (_mobileNoController.text.trim().length < 10) {
      return 'please enter valid phone number';
    }
    return '';
  }

  Future<SignUpResponse?> callSignUpApi(BuildContext context) async {
    SignUpResponse? response =
        await _authenticationRepository.postSignUpRequest(
      context,
      userNameController.text.trim(),
      _emailController.text.trim(),
      _passwordController.text,
      _mobileNoController.text,
    );
    return response;
  }

  late BuildContext _context;

  void init(
    String? phoneNumber,
    String? username,
    String? email,
    String? password,
    String? confirmPass,
  ) {
    _mobileNoController.text = phoneNumber!;
    _userNameController.text = username!;
    _emailController.text = email!;
    _passwordController.text = password!;

    _userNameController.addListener(() {
      _validateValues();
    });

    _emailController.addListener(() {
      _validateValues();
    });
    _passwordController.addListener(() {
      _validateValues();
    });

    _mobileNoController.addListener(() {
      _validateValues();
    });
  }

  _validateValues() {
    _updateValue = ValidationUtils.isEmail(_emailController.text.trim()) &&
        ValidationUtils.isValidPassword(_passwordController.text) &&
        ValidationUtils.isvalidMobile(_mobileNoController.text, 10) &&
        userNameController.text.isNotEmpty;
    notifyListeners();
  }

  void updateVisible() {
    _isPasswordConfirmVisible = !_isPasswordConfirmVisible;
    notifyListeners();
  }

  void updateVisibility() {
    _isVisible = !_isVisible;
    notifyListeners();
  }
}
