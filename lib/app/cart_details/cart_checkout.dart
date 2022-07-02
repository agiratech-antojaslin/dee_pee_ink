import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/request_quote_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/app_preferences.dart';

class CartCheckOut extends StatefulWidget {
  CartCheckOut(
      {required this.total,
      required this.totalApprox,
      required this.subTotal,
      required this.cgst,
      required this.sgst,
      required this.onPressed});

  double? total;
  double? totalApprox;
  double? subTotal;
  double? cgst;
  double? sgst;
  final Function onPressed;

  @override
  State<CartCheckOut> createState() => _CartCheckOutState();
}

class _CartCheckOutState extends State<CartCheckOut> {
  late RequestQuoteScreenController _controller;
  bool showMore = true;
  var formatter = NumberFormat('#,##,##0.00');

  @override
  void initState() {
    super.initState();
    _controller = RequestQuoteScreenController();
    _controller.addListener(_listener);
    _controller.init(context);
    print("CartCheckOut" + widget.total.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: UIDimens.size25,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(UIDimens.size30),
          topRight: Radius.circular(UIDimens.size30),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     offset: const Offset(0, -15),
        //     blurRadius: 70,
        //     color: const Color(0xFF060000).withOpacity(0.15),
        //   )
        //],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Theme(
            //   data:
            //       Theme.of(context).copyWith(dividerColor: Colors.transparent),
            // child: ExpansionTile(
            //   title: Row(children: const []),
            //   trailing: LayoutBuilder(builder: (ctx, constraints) {
            //     return Padding(
            //       padding: EdgeInsets.only(
            //         right: constraints.maxWidth * 0.5,
            //       ),
            //       child: Icon(
            //         showMore
            //             ? Icons.keyboard_arrow_up
            //             : Icons.keyboard_arrow_down,
            //       ),
            //     );
            //   }),
            //   onExpansionChanged: (val) => setState(() => showMore = !val),
            //   children: [
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //   children: [
            //     //     Text(
            //     //       StringResources.subTotal.tr(context),
            //     //       style: Styles.greyTextStyle,
            //     //     ),
            //     //     const Text.rich(TextSpan(children: [
            //     //       TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
            //     //       TextSpan(
            //     //         text: "5200",
            //     //         style: Styles.subTitleStyle,
            //     //       )
            //     //     ])),
            //     //   ],
            //     // ),
            //     // const Space(
            //     //   custom: UIDimens.size10,
            //     // ),
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //   children: [
            //     //     Text(
            //     //       StringResources.taxDetails.tr(context),
            //     //       style: Styles.greyTextStyle,
            //     //     ),
            //     //     const Text.rich(TextSpan(children: [
            //     //       TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
            //     //       TextSpan(
            //     //         text: "150",
            //     //         style: Styles.subTitleStyle,
            //     //       )
            //     //     ])),
            //     //   ],
            //     // ),
            //     // const Space(
            //     //   custom: UIDimens.size10,
            //     // ),
            //     // Row(
            //     //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     //   children: [
            //     //     Text(
            //     //       StringResources.shipping.tr(context),
            //     //       style: Styles.greyTextStyle,
            //     //     ),
            //     //     const Text.rich(TextSpan(children: [
            //     //       TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
            //     //       TextSpan(
            //     //         text: "200",
            //     //         style: Styles.subTitleStyle,
            //     //       )
            //     //     ])),
            //     //   ],
            //     // ),
            //     // const Space(isSmall: true),
            //   ],
            // ),
            // ),
            const Space(),
            (widget.subTotal != 0.0)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringResources.subTotal.tr(context),
                        style: Styles.greyTextStyle,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                        TextSpan(
                          text: formatter.format(widget.subTotal),
                          style: Styles.subTitleStyle,
                        )
                      ])),
                    ],
                  )
                : Container(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringResources.cgstTotal.tr(context),
                  style: Styles.greyTextStyle,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                  TextSpan(
                    text: formatter.format(widget.cgst),
                    style: Styles.subTitleStyle,
                  )
                ])),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringResources.sgstTotal.tr(context),
                  style: Styles.greyTextStyle,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                  TextSpan(
                    text: formatter.format(widget.sgst),
                    style: Styles.subTitleStyle,
                  )
                ])),
              ],
            ),

            (widget.totalApprox != 0.0)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringResources.total.tr(context),
                        style: Styles.greyTextStyle,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                        TextSpan(
                          text: formatter.format(widget.totalApprox),
                          style: Styles.subTitleStyle,
                        )
                      ])),
                    ],
                  )
                : Container(),
            const Space(
              custom: UIDimens.size10,
            ),
            (widget.total != 0.0)
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(UIDimens.size15),
                        color: UIColors.primaryColor),
                    child: TextButton(
                        child: Text(
                          StringResources.requestQuote.tr(context),
                          style: Styles.textBoldStyle
                              .copyWith(color: UIColors.bgColor),
                        ),
                        onPressed: () async {
                          bool result = await _controller.requestQuote();
                          if (result) {
                            Future.delayed(const Duration(seconds: 2),
                                () async {
                              await AppPreferences.setCartCount("");
                              Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, RouteConstants.quotes);
                              widget.onPressed(result.toString());
                            });
                          }
                        }),
                  )
                : Container(),
            const Space()
          ],
        ),
      ),
    );
  }
}
