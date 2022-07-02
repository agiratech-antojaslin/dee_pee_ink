import 'package:dee_pee_ink/common_widgets/common_app_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_textfield.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/forgot_password_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/app_snack_bar.dart';
import '../../../web_service/network_check.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late ForgotPasswordController _controller;

  @override
  void initState() {
    _controller = ForgotPasswordController();
    _controller.init(context);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: UIColors.bgColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  automaticallyImplyLeading: true,
                  elevation: UIDimens.zero,
                  backgroundColor: UIColors.bgColor,
                  iconTheme: const IconThemeData( color: UIColors.blackColor),
                ),
                const Space(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.appIcon,
                      height: UIDimens.size100,
                      fit: BoxFit.fitHeight,
                    )
                  ],
                ),
                const Space(),
                const Space(),
                Padding(
                    padding: const EdgeInsets.all(UIDimens.size20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                            const HorizontalSpace(
                              isSmall: true,
                            ),
                            Text(
                              StringResources.forgotPassword.tr(context),
                              style: Styles.subTitleStyle,
                            ),
                            const HorizontalSpace(
                              isSmall: true,
                            ),
                            const Expanded(
                                child: Divider(
                              color: Colors.black,
                            )),
                          ],
                        ),
                        const Space(),
                        CommonTextField(
                          controller: _controller.mobileNumberController,
                          icon: Icons.phone_android,
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          focusNode: FocusNode(),
                          labelText: StringResources.mobileNumber.tr(context),
                          hintText:
                              StringResources.enterYourMobileNumber.tr(context),
                        ),
                        const Space(),
                        CommonButton(
                          text: StringResources.sendOtp.tr(context),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_controller.isButtonEnabled) {
                              if (await NetworkCheck().check()) {
                                bool result =
                                    await _controller.callForgotPasswordApi();
                                if (result) {
                                  Navigator.pushReplacementNamed(
                                      context, RouteConstants.newPassword);
                                }
                              } else {
                                NetworkCheck()
                                    .checkNetworkAndShowSnackBar(context);
                              }
                            } else {
                              AppSnackBar(
                                      message: errorText(),
                                      color: Theme.of(context).errorColor)
                                  .showAppSnackBar(context);
                            }
                          },
                        ),
                        const Space(),
                      ],
                    ))
              ],
            ),
          )),
    );
  }

  String errorText() {
    if (_controller.mobileNumberController.text.isEmpty) {
      return 'please enter Username or e-mail';
    }
    return '';
  }
}
