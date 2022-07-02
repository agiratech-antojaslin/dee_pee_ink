import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_textfield.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/sign_up_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../model/signup_response.dart';
import '../../routing/route_param_constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpController _signUpcontroller;

  @override
  void initState() {
    _signUpcontroller = SignUpController();
    _signUpcontroller.addListener(() {
      setState(() {});
    });
    _signUpcontroller.init("", "", "", "", "");
    print("page loaded");
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
                              StringResources.createNewAccount.tr(context),
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
                          controller: _signUpcontroller.userNameController,
                          icon: Icons.people,
                          keyboardType: TextInputType.text,
                          maxLength: 30,
                          labelText: StringResources.fullName.tr(context),
                          focusNode: FocusNode(),
                          hintText:
                              StringResources.enterYourFullName.tr(context),
                        ),
                        const Space(
                          isSmall: true,
                        ),
                        CommonTextField(
                          controller: _signUpcontroller.mobileController,
                          icon: Icons.phone_android,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          focusNode: FocusNode(),
                          labelText: StringResources.mobileNumber.tr(context),
                          hintText:
                              StringResources.enterYourMobileNumber.tr(context),
                        ),
                        const Space(
                          isSmall: true,
                        ),
                        CommonTextField(
                          controller: _signUpcontroller.emailController,
                          icon: Icons.mail,
                          keyboardType: TextInputType.text,
                          maxLength: 50,
                          focusNode: FocusNode(),
                          labelText: StringResources.emailAddress.tr(context),
                          hintText: StringResources.enterYourEmail.tr(context),
                        ),

                        const Space(
                          isSmall: true,
                        ),
                        CommonTextField(
                          controller: _signUpcontroller.passwordController,
                          obscureText: _signUpcontroller.isVisible,
                          suffix: IconButton(
                            icon: Icon(
                              _signUpcontroller.isVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: UIColors.primaryColor,
                            ),
                            onPressed: () =>
                                _signUpcontroller.updateVisibility(),
                          ),
                          icon: Icons.lock,
                          keyboardType: TextInputType.text,
                          maxLength: 20,
                          focusNode: FocusNode(),
                          hintText: StringResources.enterPassword.tr(context),
                          labelText: StringResources.password.tr(context),
                        ),
                        const Space(
                          isSmall: true,
                        ),
                        // CommonTextField(
                        //   controller: _signUpcontroller.confirmPasswordController,
                        //   obscureText: _signUpcontroller.isPasswordConfirmVisible,
                        //   suffix: IconButton(
                        //     icon: Icon(_signUpcontroller.isPasswordConfirmVisible
                        //         ? Icons.visibility_off
                        //         : Icons.visibility,color: UIColors.primaryColor,),
                        //     onPressed: () => _signUpcontroller.updateVisible(),
                        //   ),
                        //   icon: Icons.lock,
                        //   keyboardType: TextInputType.text,
                        //   maxLength: 20,
                        //   focusNode: FocusNode(),
                        //   hintText: StringResources.reEnterYourPassword.tr(context),
                        //   labelText: StringResources.reEnterPassword.tr(context),
                        // ),
                        const Space(
                          isSmall: true,
                        ),
                        const Space(),
                        CommonButton(
                          color: _signUpcontroller.isButtonEnabled
                              ? UIColors.primaryColor
                              : Colors.black,
                          text: StringResources.submit.tr(context),
                          onPressed: () async {
                            if (_signUpcontroller.isButtonEnabled) {
                              SignUpResponse? response = await _signUpcontroller
                                  .callSignUpApi(context);
                              if (response != null) {
                                Navigator.pushReplacementNamed(context,
                                    RouteConstants.accountVerificationPage,
                                    arguments: {
                                      RouteParamConstants.mobileNumber:
                                          _signUpcontroller
                                              .mobileController.text
                                              .trim()
                                    });
                              }
                            } else {
                              String error = _signUpcontroller.errorText();
                              AppSnackBar(
                                      message: error,
                                      color: Theme.of(context).errorColor)
                                  .showAppSnackBar(context);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(StringResources.alreadyHaveAnAccount
                                .tr(context)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.login);
                                },
                                child: Text(
                                  StringResources.signIn.tr(context),
                                  style: Styles.textStyle3
                                      .copyWith(color: UIColors.primaryColor),
                                ))
                          ],
                        ),
                        const Space(),
                        const Space(),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
