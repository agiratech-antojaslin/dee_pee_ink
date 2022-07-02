import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/model/authentication/resent_otp_model.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pinput/pinput.dart';

import '../../common_widgets/app_snack_bar.dart';
import '../../common_widgets/common_app_bar.dart';
import '../../common_widgets/space.dart';
import '../../constants/string_resources.dart';
import '../../controllers/account_verification_controller.dart';
import '../../ui_utils/assets.dart';
import '../../ui_utils/ui_dimens.dart';

class AccountVerificationPage extends StatefulWidget {
  const AccountVerificationPage({Key? key, required this.mobileNumber})
      : super(key: key);
  final String mobileNumber;

  @override
  State<StatefulWidget> createState() => _AccountVerificationPage();
}

class _AccountVerificationPage extends State<AccountVerificationPage> {
  late AccountVerificationController _controller;

  @override
  void initState() {
    _controller = AccountVerificationController();
    _controller.init(context);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        maintainBottomViewPadding: true,
        child: Scaffold(
            body: SingleChildScrollView(
          child: Column(children: <Widget>[
            CommonAppBar(
              title: "",
              automaticallyImplyLeading: true,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: UIDimens.size20,
                  right: UIDimens.size20,
                  top: UIDimens.size50),
              child: Column(
                children: [
                  Image.asset(
                    Assets.mobile,
                    height: UIDimens.size150,
                    fit: BoxFit.fitHeight,
                  ),
                  Space(),
                  _headerTitle,
                  Space(
                    isSmall: true,
                  ),
                  _enterOTPTitle,
                  Space(),
                  _otpField,
                  Space(),
                  _submitButton,
                  Space(),
                  _resendOTP
                ],
              ),
            )
          ]),
        )));
  }

  Widget get _headerTitle => Center(
      child: Text(StringResources.verificationCode.tr(context),
          style: Styles.titleStyle));

  Widget get _enterOTPTitle => Center(
          child: Text(
        StringResources.verificationCodeDescription.tr(context),
        style: Styles.textStyle,
        textAlign: TextAlign.center,
      ));

  Widget get _otpField => Pinput(
        validator: (s) {
          return null;
        },
        controller: _controller.otpController,
        useNativeKeyboard: true,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
        onCompleted: (pin) => print(pin),
      );

  Widget get _submitButton => CommonButton(
        text: StringResources.submit.tr(context),
        onPressed: () async {
          if (_controller.isButtonEnabled) {
            bool result = await _controller.submitVerificationCode(
                CommonOtpModel(
                    user: User(
                        mobileNumber: widget.mobileNumber,
                        otp: _controller.otpController.text.trim())));
            if (result) {
              Navigator.pushReplacementNamed(context, RouteConstants.login);
            }
          } else {
            AppSnackBar(message: errorText(), color: Colors.red)
                .showAppSnackBar(context);
          }
        },
      );

  String? errorText() {
    if (_controller.otpController.text.trim().isEmpty ||
        _controller.otpController.text.trim().length != 4) {
      return StringResources.invalidOtp.tr(context);
    }
    return null;
  }

  Widget get _resendOTP => Center(
          child: GestureDetector(
        child: Text(
          StringResources.resendOtp.tr(context),
          style: Styles.textStyle,
        ),
        onTap: () async {
          bool result = await _controller.resendOtp(
              CommonOtpModel(user: User(mobileNumber: widget.mobileNumber)));
          if (result) {}
        },
      ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
