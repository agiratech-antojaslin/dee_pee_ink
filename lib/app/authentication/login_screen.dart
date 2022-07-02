import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_textfield.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/login_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/app_snack_bar.dart';
import '../../web_service/network_check.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LogInController _controller;

  @override
  void initState() {
    _controller = LogInController();
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
                const Space(),
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
                              StringResources.loginUsingMobileNumber
                                  .tr(context),
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
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          focusNode: _controller.emailInputFocusNode,
                          hintText:
                              StringResources.enterYourMobileNumber.tr(context),
                          labelText: StringResources.mobileNumber.tr(context),
                        ),
                        const Space(
                          isSmall: true,
                        ),
                        CommonTextField(
                          controller: _controller.passwordController,
                          obscureText: _controller.isVisible,
                          suffix: IconButton(
                            icon: Icon(
                              _controller.isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: UIColors.primaryColor,
                            ),
                            onPressed: () => _controller.updateVisibility(),
                          ),
                          icon: Icons.lock,
                          keyboardType: TextInputType.text,
                          maxLength: 20,
                          focusNode: FocusNode(),
                          hintText: StringResources.enterPassword.tr(context),
                          labelText: StringResources.password.tr(context),
                        ),
                        const Space(isSmall: true),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _rememberMe,
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.forgotPassword);
                                },
                                child: Text.rich(TextSpan(
                                    text: StringResources.forgotPassword
                                        .tr(context),
                                    style: Styles.textStyle3
                                        .copyWith(color: UIColors.primaryColor),
                                    children: [
                                      TextSpan(
                                          text: StringResources.questionMark
                                              .tr(context))
                                    ]))),
                          ],
                        ),
                        const Space(
                          custom: UIDimens.size10,
                        ),
                        CommonButton(
                          text: StringResources.submit.tr(context),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_controller.isButtonEnabled) {
                              if (await NetworkCheck().check()) {
                                bool result = await _controller.callSignInApi();
                                if (result) {
                                  Navigator.pushReplacementNamed(
                                      context, RouteConstants.home);
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(StringResources.dontHaveAnAccount.tr(context)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.signUp);
                                },
                                child: Text(
                                  StringResources.signUp.tr(context),
                                  style: Styles.textStyle3
                                      .copyWith(color: UIColors.primaryColor),
                                ))
                          ],
                        ),
                        const Space(),
                      ],
                    ))
              ],
            ),
          )),
    );
  }

  Widget get _rememberMe => GestureDetector(
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
              height: UIDimens.size25,
              width: UIDimens.size25,
              child: Theme(
                data: ThemeData(unselectedWidgetColor: UIColors.primaryColor),
                child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(UIDimens.size5),
                    ),
                    activeColor: UIColors.primaryColor,
                    value: _controller.isRememberMe,
                    onChanged: _controller.updateRememberMe),
              )),
          const SizedBox(width: UIDimens.size5),
          Text(StringResources.rememberMe.tr(context),
              style: Styles.textStyle.copyWith(fontSize: UIDimens.size14))
        ]),
      );

  String errorText() {
    if (_controller.mobileNumberController.text.isEmpty) {
      return 'Please Enter valid Phone number';
    } else if (_controller.passwordController.text.isEmpty) {
      return 'Please Enter valid Password';
    }
    return '';
  }
}
