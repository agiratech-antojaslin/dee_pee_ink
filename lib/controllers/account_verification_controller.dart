import 'package:dee_pee_ink/model/authentication/resent_otp_model.dart';
import 'package:dee_pee_ink/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';

class AccountVerificationController extends ChangeNotifier {
  AuthenticationRepository _authenticationRepository =
      AuthenticationRepository();

  TextEditingController _otpController = TextEditingController();

  TextEditingController get otpController => _otpController;

  bool _updateValue = false;

  bool get isButtonEnabled => _updateValue;

  String? _phoneNumber;

  String? get phoneNumber => _phoneNumber;

  BuildContext? _context;

  void init(BuildContext context) async {
    _phoneNumber = "details.phoneNumber";
    _context = context;
    _otpController.addListener(() {
      _validateValues();
    });
    notifyListeners();
  }

  Future<bool> submitVerificationCode(CommonOtpModel model) async =>
      _authenticationRepository.submitAccountVerification(_context, model);

  Future<bool> resendOtp(dynamic model) async =>
      _authenticationRepository.resendOtp(_context, model);

  void _validateValues() {
    _updateValue = _otpController.text.trim().isNotEmpty;
    print(_updateValue);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
