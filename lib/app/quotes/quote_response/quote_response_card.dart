import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class QuoteResponseListCard extends StatefulWidget {
  QuoteResponseListCard(
      {Key? key,
      this.titleText,
      this.colorText,
      this.amount,
      this.quantity,
      this.quoteNo,
      this.orderDate,
      this.orderStatus,
      this.orderNo,
      this.quoteStatus,
      this.requestDate,
        this.download})
      : super(key: key);

  final String? orderNo;
  final String? quoteNo;
  final String? titleText;
  final String? colorText;
  final String? amount;
  final String? orderStatus;
  final String? orderDate;
  final String? quantity;
  final String? quoteStatus;
  final String? requestDate;
  final VoidCallback? download;

  @override
  State<QuoteResponseListCard> createState() => _QuoteResponseListCardState();
}

class _QuoteResponseListCardState extends State<QuoteResponseListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: UIDimens.size10, vertical: UIDimens.size5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: UIDimens.size15, vertical: UIDimens.size10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text.rich(
                        TextSpan(
                            text: StringResources.quoteNo.tr(context),
                            style: Styles.textStyle3
                                .copyWith(fontSize: UIDimens.size15),
                            children: [
                              TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2),
                            ]),
                      ),
                      Text(widget.quoteNo!,
                          style: Styles.greyTextStyle
                              .copyWith(fontWeight: FontWeight.normal)),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: UIDimens.size5,
              ),
              if (widget.orderNo != null)
                Row(
                  children: [
                    Text.rich(TextSpan(
                        text: StringResources.orderNo.tr(context),
                        style: Styles.textStyle3
                            .copyWith(fontSize: UIDimens.size15),
                        children: [
                          TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                        ])),
                    Text(widget.orderNo!,
                        style: Styles.greyTextStyle
                            .copyWith(fontWeight: FontWeight.normal)),
                  ],
                ),
              const SizedBox(
                height: UIDimens.size5,
              ),
              if(widget.amount != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: StringResources.price.tr(context),
                            style: Styles.textStyle3
                                .copyWith(fontSize: UIDimens.size15)),
                        TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: '\u{20B9}',
                            style: Styles.textStyle
                                .copyWith(fontSize: UIDimens.size16)),
                        TextSpan(
                          text: widget.amount,
                          style: Styles.textStyle,
                        )
                      ])),
                    ],
                  ),
                  const Space(
                    custom: UIDimens.size5,
                  ),
                  if (widget.orderStatus != null)
                    Row(
                      children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: StringResources.orderStatus.tr(context),
                              style: Styles.textStyle3
                                  .copyWith(fontSize: UIDimens.size15)),
                          TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                        ])),
                        Text.rich(TextSpan(children: [
                          TextSpan(
                              text: widget.orderStatus!,
                              style: Styles.textStyle)
                        ])),
                      ],
                    ),
                  if (widget.orderDate != null)
                    Row(
                      children: [
                        Text.rich(TextSpan(
                            text: StringResources.orderDate.tr(context),
                            style: Styles.textStyle3
                                .copyWith(fontSize: UIDimens.size15),
                            children: [
                              TextSpan(
                                  text: StringResources.colon.tr(context),
                                  style: Styles.textStyle2),
                              TextSpan(
                                  text: widget.orderDate!,
                                  style: Styles.textStyle
                                      .copyWith(fontWeight: FontWeight.normal))
                            ]))
                      ],
                    ),
                  if (widget.requestDate != null)
                    Row(
                      children: [
                        Text.rich(TextSpan(
                            text: StringResources.requestDate.tr(context),
                            style: Styles.textStyle3
                                .copyWith(fontSize: UIDimens.size15),
                            children: [
                              TextSpan(
                                  text: StringResources.colon.tr(context),
                                  style: Styles.textStyle2),
                              TextSpan(
                                  text: widget.requestDate!,
                                  style: Styles.textStyle.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: UIDimens.size14))
                            ]))
                      ],
                    ),
                  const Space(
                    custom: UIDimens.size5,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (widget.quoteStatus != null)
                    Container(
                      padding: const EdgeInsets.only(
                          top: UIDimens.size2,
                          right: UIDimens.size10,
                          left: UIDimens.size10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(UIDimens.size5),
                          color: UIColors.greenColor),
                      child: Text.rich(TextSpan(
                        text: widget.quoteStatus,
                        style: Styles.textStyle3
                            .copyWith(color: UIColors.whiteColor),
                      )),
                    ),
                  const Spacer(),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: widget.download,
                        child: SizedBox(
                          width: UIDimens.size40,
                          height: UIDimens.size40,
                          child: Image.asset(
                            "assets/icons/download_quote_blue.png",
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
