import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class InvoiceDetails extends StatefulWidget {
  const InvoiceDetails(
      {Key? key,
      this.paymentReceived,
      this.transactionId,
      this.paymentMethod,
      this.paymentStatus})
      : super(key: key);

  final String? paymentReceived;
  final String? transactionId;
  final String? paymentMethod;
  final String? paymentStatus;

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: UIDimens.size5, vertical: UIDimens.size5),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: UIDimens.size15, vertical: UIDimens.size10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: StringResources.paymentReceived.tr(context),
                        style: Styles.textStyle3
                            .copyWith(fontSize: UIDimens.size16),
                      ),
                    ),
                    Text(widget.paymentReceived!,
                        style: Styles.greyTextStyle
                            .copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
                const Text.rich(TextSpan(children: [
                  TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                  TextSpan(
                    text: "3650",
                    style: Styles.subTitleStyle,
                  )
                ])),
              ],
            ),
            const SizedBox(
              height: UIDimens.size5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: StringResources.transactionId.tr(context),
                          style: Styles.textStyle3
                              .copyWith(fontSize: UIDimens.size16)),
                      TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                    ])),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: widget.transactionId!,
                        style: Styles.textStyle,
                      )
                    ])),
                  ],
                ),
                const Space(
                  custom: UIDimens.size5,
                ),
                Row(
                  children: [
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: StringResources.paymentMethod.tr(context),
                          style: Styles.textStyle3
                              .copyWith(fontSize: UIDimens.size16)),
                      TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                    ])),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: widget.paymentMethod!, style: Styles.textStyle)
                    ])),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                        text: StringResources.paymentStatus.tr(context),
                        style: Styles.textStyle3
                            .copyWith(fontSize: UIDimens.size16),
                        children: [
                          TextSpan(
                              text: StringResources.colon.tr(context),
                              style: Styles.textStyle2),
                          TextSpan(
                              text: widget.paymentStatus!,
                              style: Styles.textStyle
                                  .copyWith(fontWeight: FontWeight.normal))
                        ])),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: UIDimens.size40,
                        height: UIDimens.size40,
                        child: Image.asset(
                          "assets/icons/download_quote_green.png",
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
