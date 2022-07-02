import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:dee_pee_ink/utils/app_configuration.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 2), () {
      _moveToNextPage();
    });
  }

  void _moveToNextPage() {
    print("valueeee " + AppConfiguration().isUserLoggedIn.toString());
    if (AppConfiguration().isUserLoggedIn) {
      Navigator.pushReplacementNamed(context, RouteConstants.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: UIColors.bgColor,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
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
              const Spacer(),
              Padding(
                  padding: const EdgeInsets.all(UIDimens.size20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
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
                            StringResources.continueWith.tr(context),
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
                      const Space(),
                      if (!AppConfiguration().isUserLoggedIn)
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.login);
                                },
                                child: Center(
                                  child: Text(
                                    StringResources.signIn.tr(context),
                                    style: Styles.textStyle2
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                padding: const EdgeInsets.all(UIDimens.size10),
                                color: UIColors.primaryColor,
                              ),
                            ),
                            const HorizontalSpace(
                              isSmall: true,
                            ),
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RouteConstants.signUp);
                                },
                                child: Center(
                                  child: Text(
                                    StringResources.signUp.tr(context),
                                    style: Styles.textStyle2
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                padding: const EdgeInsets.all(UIDimens.size10),
                                color: UIColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      const Space(),
                      const Space(),
                    ],
                  ))
            ],
          )),
    );
  }
}
