import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class AdminAcceptedQuotePage extends StatelessWidget {
  const AdminAcceptedQuotePage({Key? key}) : super(key: key);

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
                    AdminAcceptedCard(
                      titleText: "Videojet Purple Ink And Make Ups",
                      colorText: "All",
                      amount: "Rs 700",
                      quantity: "100",
                      quoteNo: "Q2402",
                    ),
                    AdminAcceptedCard(
                      titleText: "Linx Printer LCD Display",
                      colorText: "blue",
                      amount: "Rs 1400",
                      quantity: "230",
                      quoteNo: "Q2512",
                    )
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

class AdminAcceptedCard extends StatefulWidget {
  const AdminAcceptedCard({
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
  State<AdminAcceptedCard> createState() => _AdminAcceptedCard();
}

class _AdminAcceptedCard extends State<AdminAcceptedCard> {
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 2,
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: UIDimens.size50,
                  width: UIDimens.size50,
                  child: CommonIcon(
                    path: Assets.accept,
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
