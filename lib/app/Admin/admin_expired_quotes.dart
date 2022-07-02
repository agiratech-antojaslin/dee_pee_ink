import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class AdminExpiredQuotePage extends StatelessWidget {
  const AdminExpiredQuotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: UIColors.bgColor,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    AdminExpiredCard(
                      titleText: "Videojet Purple Ink\n And Make Ups",
                      colorText: "All",
                      amount: "Rs 700",
                      quantity: "100",
                      quoteNo: "Q2402",
                    ),
                    AdminExpiredCard(
                      titleText: "Imaje Fast Dry Ink\n And Additive",
                      colorText: "All",
                      amount: "Rs 1300",
                      quantity: "200",
                      quoteNo: "Q0224",
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class AdminExpiredCard extends StatefulWidget {
  const AdminExpiredCard({
    Key? key,
    this.quoteNo,
    this.titleText,
    this.colorText,
    this.amount,
    this.quantity,
  }) : super(key: key);

  final String? titleText;
  final String? colorText;
  final String? amount;
  final String? quantity;
  final String? quoteNo;

  @override
  State<AdminExpiredCard> createState() => _AdminExpiredCard();
}

class _AdminExpiredCard extends State<AdminExpiredCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIDimens.size10),
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: UIDimens.size20),
              child: Center(
                child: Column(children: [
                  Text(
                    StringResources.quoteNo.tr(context),
                    style: Styles.textStyle3
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    widget.quoteNo!,
                    style: Styles.textBoldStyle,
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: UIDimens.size10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.titleText!, style: Styles.textBoldStyle),
                  const SizedBox(
                    height: UIDimens.size10,
                  ),
                  Row(
                    children: [
                      Text.rich(TextSpan(
                          text: StringResources.color.tr(context),
                          style: Styles.greyTextStyle,
                          children: [
                            TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                          ])),
                      const Space(isSmall: true),
                      Text(widget.colorText!,
                          style: Styles.greyTextStyle
                              .copyWith(fontWeight: FontWeight.normal)),
                    ],
                  ),
                  const Space(
                    isSmall: true,
                  ),
                  Row(
                    children: [
                      Text(widget.amount!,
                          style: Styles.textStyle2
                              .copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Space(
                    isSmall: true,
                  ),
                  Row(
                    children: [
                      Text.rich(TextSpan(
                          text: StringResources.quantity.tr(context),
                          style: Styles.textStyle,
                          children: [
                            TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                          ])),
                      Text(widget.quantity!, style: Styles.textStyle),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: UIDimens.size20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: UIDimens.size50,
                  width: UIDimens.size50,
                  child: CommonIcon(
                    path: Assets.denied,
                    onPressed: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
