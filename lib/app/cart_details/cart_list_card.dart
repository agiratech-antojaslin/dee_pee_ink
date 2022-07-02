import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/cart_view_controller.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartListCard extends StatefulWidget {
  CartListCard(
      {Key? key,
      this.image,
      this.titleText,
      this.colorText,
      this.amount,
      this.qty,
      this.colorID,
      this.quoteItemId,
      this.onPressedDelete})
      : super(key: key);

  final String? titleText;
  final String? colorText;
  final String? amount;
  final String? image;
  final String? qty;
  final String? colorID;
  final String? quoteItemId;
  final Function? onPressedDelete;

  @override
  State<CartListCard> createState() => _CartListCardState();
}

class _CartListCardState extends State<CartListCard> {
  final TextEditingController _controller = TextEditingController();
  late ViewCartScreenController _controllerEdit;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.qty.toString();
    _controllerEdit = ViewCartScreenController();
    _controllerEdit.addListener(_listener);
    _controllerEdit.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    _controllerEdit.dispose();
  }

  void _listener() {
    setState(() {});
  }

  void _incrementCounter() {
    int currentValue = int.parse(_controller.text);
    setState(() {
      currentValue++;
      _controller.text = (currentValue).toString();
    });
  }

  void _decrementCounter() {
    int currentValue = int.parse(_controller.text);
    setState(() {
      if (currentValue != 1) {
        currentValue--;
        _controller.text = (currentValue >= 0 ? currentValue : 0).toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: UIDimens.size10, vertical: UIDimens.size3),
      child: Card(
        child: Row(
          children: [
            SizedBox(
              width: UIDimens.size110,
              child: Container(
                padding: const EdgeInsets.all(UIDimens.size10),
                decoration: BoxDecoration(
                  color: UIColors.whiteColor,
                  borderRadius: BorderRadius.circular(UIDimens.size15),
                ),
                child: Image.network(
                  widget.image!,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            const SizedBox(
              width: UIDimens.size5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Space(
                  isSmall: true,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child:
                        Text(widget.titleText!, style: Styles.textBoldStyle)),
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
                    Text.rich(TextSpan(
                      children: [
                        TextSpan(
                            text: '\u{20B9}',
                            style: Styles.textStyle2
                                .copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: widget.amount!,
                            style: Styles.textStyle2
                                .copyWith(fontWeight: FontWeight.bold))
                      ],
                    )),
                  ],
                ),
                const Space(
                  isSmall: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: UIDimens.size25,
                      height: UIDimens.size25,
                      child: GestureDetector(
                          onTap: _decrementCounter,
                          child: Image.asset(
                            "assets/icons/minus.png",
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: UIDimens.size3),
                      child: Container(
                        color: UIColors.whiteColor,
                        width: UIDimens.size45,
                        height: UIDimens.size28,
                        foregroundDecoration: BoxDecoration(
                          border: Border.all(
                            color: UIColors.whiteColor,
                          ),
                        ),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: Styles.textStyle.copyWith(
                              fontSize: UIDimens.size15,
                              color: UIColors.primaryColor),
                          decoration: const InputDecoration(
                            fillColor: UIColors.whiteColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: UIColors.whiteColor),
                            ),
                            contentPadding: EdgeInsets.all(UIDimens.size5),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          controller: _controller,
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: false,
                            signed: true,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(3),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: UIDimens.size25,
                      height: UIDimens.size25,
                      child: GestureDetector(
                          onTap: _incrementCounter,
                          child: Image.asset(
                            "assets/icons/add.png",
                          )),
                    ),
                  ],
                ),
                const Space(
                  isSmall: true,
                ),
              ],
            ),
            Column(
              children: [
                CommonIcon(
                    path: Assets.bin,
                    onPressed: () {
                      setState(() {
                        widget.onPressedDelete;
                      });
                      // setState(() {
                      //   _controllerEdit
                      //       .deleteQuoteItem(widget.quoteItemId.toString());
                      // });

                      print(widget.quoteItemId.toString());
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
