import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:flutter/material.dart';

import '../../../common_widgets/space.dart';
import '../../../constants/string_resources.dart';
import '../../../ui_utils/styles.dart';
import '../../../ui_utils/ui_colors.dart';
import '../../../ui_utils/ui_dimens.dart';

class QuoteDetailsCard extends StatelessWidget {
  QuoteDetailsCard({
    Key? key,
    this.image,
    this.titleText,
    this.colorText,
    this.items,
    this.amount,
    this.quantity,
    required this.offerPrice,
  }) : super(key: key);

  final String? image;
  final String? titleText;
  final String? colorText;
  final String? items;
  final String? amount;
  final String? quantity;
  final String? offerPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: UIDimens.size3, horizontal: UIDimens.size10),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: UIDimens.size15),
              child: Row(
                children: [
                  SizedBox(
                    width: UIDimens.size90,
                    child: Container(
                      padding: const EdgeInsets.all(UIDimens.size10),
                      decoration: BoxDecoration(
                        color: UIColors.whiteColor,
                        borderRadius: BorderRadius.circular(UIDimens.size15),
                      ),
                      child: Image.network(image!),
                    ),
                  ),
                  const SizedBox(width: UIDimens.size20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Space(
                        isSmall: true,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          child: Text(titleText!.trim(),
                              style: Styles.textBoldStyle)),
                      const SizedBox(
                        height: UIDimens.size10,
                      ),
                      Row(
                        children: [
                          Text.rich(TextSpan(
                              text: StringResources.color.tr(context),
                              style: Styles.greyTextStyle15,
                              children: [
                                TextSpan(
                                    text: StringResources.colon.tr(context),style: Styles.textStyle2)
                              ])),
                          const Space(isSmall: true),
                          Text(colorText!,
                              style: Styles.greyTextStyle15
                                  .copyWith(fontWeight: FontWeight.normal)),
                        ],
                      ),
                      const Space(isSmall: true),
                      Row(
                        children: [
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                  text: StringResources.items.tr(context),
                                  style: Styles.greyTextStyle15,
                                  children: [
                                    TextSpan(
                                        text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                  ]),
                              TextSpan(
                                  text: items!, style: Styles.greyTextStyle15)
                            ],
                          )),
                        ],
                      ),
                      const Space(
                        isSmall: true,
                      ),
                      Row(
                        children: [
                          Text.rich(TextSpan(
                              text: StringResources.quantity.tr(context),
                              style: Styles.textBoldStyle15,
                              children: [
                                TextSpan(
                                    text: StringResources.colon.tr(context),style: Styles.textStyle2)
                              ])),
                          const Space(isSmall: true),
                          Text(quantity!,
                              style: Styles.textStyle
                                  .copyWith(fontWeight: FontWeight.normal)),
                        ],
                      ),
                      const Space(
                        isSmall: true,
                      ),
                      Row(
                        children: [
                          Text.rich(TextSpan(
                            children: [
                              TextSpan(
                                  text: StringResources.prices.tr(context),
                                  style: Styles.textBoldStyle15,
                                  children: [
                                    TextSpan(
                                        text: StringResources.colon.tr(context),style: Styles.textStyle2)
                                  ]),
                              TextSpan(
                                  text: '\u{20B9}',
                                  style: Styles.textStyle2.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              TextSpan(
                                  text: amount!, style: Styles.textBoldStyle15)
                            ],
                          )),
                        ],
                      ),
                      const Space(
                        isSmall: true,
                      ),
                      if (offerPrice != "null")
                        Row(
                          children: [
                            Text.rich(TextSpan(
                              children: [
                                TextSpan(
                                    text:
                                        StringResources.offerPrice.tr(context),
                                    style: Styles.textBoldStyle15,
                                    children: [
                                      TextSpan(
                                          text:
                                              StringResources.colon.tr(context),style: Styles.textStyle2)
                                    ]),
                                TextSpan(
                                    text: '\u{20B9}',
                                    style: Styles.textStyle2.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                TextSpan(
                                    text: offerPrice!,
                                    style: Styles.textBoldStyle15)
                              ],
                            )),
                          ],
                        ),
                      const Space(
                        isSmall: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
