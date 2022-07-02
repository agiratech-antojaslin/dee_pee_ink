import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/add_to_quote_controller.dart';
import 'package:dee_pee_ink/routing/route_constants.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddToQuote extends StatefulWidget {
  AddToQuote(
      {required this.total,
      required this.productId,
      required this.colorId,
      required this.quantity});

  final double total;
  String productId, colorId, quantity;

  @override
  State<AddToQuote> createState() => _AddToQuoteState();
}

class _AddToQuoteState extends State<AddToQuote> {
  late AddToQuoteScreenController _controller;
  var formatter = NumberFormat('#,##,##0.00');

  @override
  void initState() {
    super.initState();
    _controller = AddToQuoteScreenController();
    _controller.addListener(_listener);
    _controller.init(context);
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
        vertical: UIDimens.size15,
        horizontal: UIDimens.size30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        "Total:",
                        style: Styles.textBoldStyle,
                      ),
                      Text.rich(TextSpan(
                        text: '\u{20B9}',
                      children: [
                        TextSpan(
                          text: formatter.format(widget.total),
                          style: Styles.textStyle,
                        )
                      ]),
                      )
                    ],
                  ),
                ),
                const HorizontalSpace(isSmall: true),
                SizedBox(
                  width: (UIDimens.size190),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(UIDimens.size15),
                        color: UIColors.primaryColor),
                    child: TextButton(
                        child: Text(
                          StringResources.addtoQuote.tr(context),
                          style: Styles.textBoldStyle
                              .copyWith(color: UIColors.bgColor),
                        ),
                        onPressed: () async {
                          if (widget.colorId.isNotEmpty) {
                            bool result = await _controller.addToQuote(
                                widget.productId,
                                widget.colorId,
                                widget.quantity);
                            if (result) {
                              // Navigator.pop(context);
                              Navigator.pushNamed(
                                  context, RouteConstants.cartDetails);
                            }
                          } else {
                            AppSnackBar(
                                    message:
                                        StringResources.chooseColor.tr(context),
                                    color: Theme.of(context).errorColor)
                                .showAppSnackBar(context);
                          }
                        }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
