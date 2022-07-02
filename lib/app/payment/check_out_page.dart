import 'package:dee_pee_ink/common_widgets/common_app_bar.dart';
import 'package:dee_pee_ink/common_widgets/common_button.dart';
import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(UIDimens.size20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonButton(
              text: StringResources.continueToPay.tr(context),
              onPressed: () =>
                  Navigator.pushNamed(context, RouteConstants.checkOut),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonAppBar(
                  title: StringResources.checkOut.tr(context),
                  automaticallyImplyLeading: true,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: UIDimens.size15),
                  child: Text(
                    StringResources.selectPaymentMethod.tr(context),
                    style: Styles.titleStyle.copyWith(fontSize: 23),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: UIDimens.size15),
                  child: Row(
                    children: [
                      CommonIcon(
                          path: Assets.masterIcon,
                          size: UIDimens.size50,
                          onPressed: () {}),
                      const Space(),
                      const Text(
                        "1234 5678 9123 4567",
                        style: Styles.textStyle2,
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
