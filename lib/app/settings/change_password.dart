import 'package:dee_pee_ink/common_widgets/common_app_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_textfield.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/app_snack_bar.dart';
import '../../controllers/change_password_controller.dart';
import '../../web_service/network_check.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late ChangePasswordController _controller;

  @override
  void initState() {
    _controller = ChangePasswordController();
    _controller.addListener(() {
      setState(() {});
    });
    _controller.init(context);
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
                CommonAppBar(
                  title: StringResources.changePassword.tr(context),
                  automaticallyImplyLeading: true,
                ),
                Padding(
                    padding: const EdgeInsets.all(UIDimens.size20),
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: _controller.currentPasswordController,
                          obscureText: _controller.isCurrentPasswordVisible,
                          suffix: IconButton(
                            icon: Icon(
                              _controller.isCurrentPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: UIColors.primaryColor,
                            ),
                            onPressed: () => _controller.updateCurrentVisible(),
                          ),
                          icon: Icons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: FocusNode(),
                          labelText: StringResources.currentPassword.tr(context),
                          hintText:
                          StringResources.enterYourCurrentPassword.tr(context),
                        ),
                        const Space(isSmall:true),
                        CommonTextField(
                          controller: _controller.newPasswordController,
                          obscureText: _controller.isNewPasswordVisible,
                          suffix: IconButton(
                            icon: Icon(
                              _controller.isNewPasswordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: UIColors.primaryColor,
                            ),
                            onPressed: () => _controller.updateVisibly(),
                          ),
                          icon: Icons.lock,
                          keyboardType: TextInputType.visiblePassword,
                          focusNode: FocusNode(),
                          labelText: StringResources.newPassword.tr(context),
                          hintText:
                          StringResources.enterYourNewPassword.tr(context),
                        ),
                        // const Space(isSmall:true),
                        // CommonTextField(
                        //   controller: _controller.confirmPasswordController,
                        //   obscureText: _controller.isConfirmPasswordVisible,
                        //   suffix: IconButton(
                        //     icon: Icon(
                        //       _controller.isConfirmPasswordVisible
                        //           ? Icons.visibility_off
                        //           : Icons.visibility,
                        //       color: UIColors.primaryColor,
                        //     ),
                        //     onPressed: () => _controller.updateVisible(),
                        //   ),
                        //   icon: Icons.lock,
                        //   keyboardType: TextInputType.visiblePassword,
                        //   focusNode: FocusNode(),
                        //   labelText: StringResources.reEnterPassword.tr(context),
                        //   hintText:
                        //   StringResources.reEnterYourNewPassword.tr(context),
                        // ),
                        const Space(),
                        CommonButton(
                          text: StringResources.submit.tr(context),
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            if (_controller.isButtonEnabled) {
                              if (await NetworkCheck().check()) {
                                bool result =
                                await _controller.callUpdatePasswordApi();
                                if (result) {
                                  Navigator.pushReplacementNamed(
                                      context, RouteConstants.login);
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
    if (_controller.currentPasswordController.text.isEmpty) {
      return 'please enter Current Password';
    } else if (_controller.newPasswordController.text.isEmpty) {
      return 'please enter New Password';
    } else if(_controller.currentPasswordController.text == _controller.newPasswordController.text){
      return 'Current password and New password should not be same';
    }
    return '';
  }
}