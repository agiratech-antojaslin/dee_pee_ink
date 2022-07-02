import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/cart_view_controller.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:dee_pee_ink/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'cart_checkout.dart';

class CartDetailsPage extends StatefulWidget {
  const CartDetailsPage({Key? key}) : super(key: key);

  @override
  _CartDetailsPageState createState() => _CartDetailsPageState();
}

class _CartDetailsPageState extends State<CartDetailsPage> {
  late ViewCartScreenController _controller;
  var formatter = NumberFormat('#,##,##0.00');

  @override
  void initState() {
    super.initState();
    _controller = ViewCartScreenController();
    _controller.addListener(_listener);
    _controller.init(context);
    // _controller.qtyController.text = "1";
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _listener() {
    setState(() {});
  }

  onPressedDelete(String quoteItemId) {
    _controller.deleteQuoteItem(quoteItemId);
    print(quoteItemId);
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).pop(true);
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: WillPopScope(
            onWillPop: _onBackPressed,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: UIColors.bgColor,
                centerTitle: true,
                iconTheme: const IconThemeData(
                  color: UIColors.blackColor, //change your color here
                ),
                elevation: UIDimens.size2,
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CommonIcon(
                      path: Assets.back,
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      size: UIDimens.size2),
                ),
                title: Text(StringResources.orderConfirm.tr(context),
                    style: Styles.textBoldStyle
                        .copyWith(color: UIColors.greyColor)),
              ),
              backgroundColor: UIColors.bgColor,
              bottomNavigationBar: (_controller.quoteItems.isNotEmpty)
                  ? CartCheckOut(
                      onPressed: (String value) {
                        if (value == "true") {
                          _controller.init(context);
                          print("onPressed " + value);
                        }
                      },
                      total: _controller.total,
                      subTotal: _controller.cartItems!.data!.subTotal!,
                      cgst: _controller.cartItems!.data!.cgstAmount!,
                      sgst: _controller.cartItems!.data!.sgstSmount!,
                      totalApprox:
                          _controller.cartItems!.data!.totaApproxAmount!,
                    )
                  : const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: UIDimens.size15,
                          vertical: UIDimens.size15),
                    ),
              body: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Space(
                        isSmall: true,
                      ),
                      (_controller.quoteItems.isNotEmpty)
                          ? Expanded(
                              child: ListView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  // _controller.controllerQty.text =
                                  //     _controller.quoteItems[index].quantity.toString();
                                  // _controller.controllerQty
                                  //     .add(TextEditingController());

                                  return CartListCard(
                                      index,
                                      _controller
                                          .quoteItems[index].product!.name
                                          .toString(),
                                      _controller.quoteItems[index].color!.name
                                          .toString(),
                                      formatter.format(_controller
                                          .quoteItems[index]
                                          .product!
                                          .approxPrice),
                                      _controller.quoteItems[index].product!
                                          .pictures!.length>0?_controller.quoteItems[index].product!
                                          .pictures![0].url.toString():AppConstants.defaultImage,

                                      _controller.quoteItems[index].quantity
                                          .toString(),
                                      _controller.quoteItems[index].color!.id
                                          .toString(),
                                      _controller.quoteItems[index].id
                                          .toString());
                                },
                                itemCount: _controller.quoteItems.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                              ),
                            )
                          : _generateEmptyCart(),
                    ],
                  )
                ],
              ),
            )));
  }

  Widget CartListCard(
      int index,
      String titleText,
      String colorText,
      String amount,
      String image,
      String qty,
      String colorID,
      String quoteItemId) {
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
                  image,
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
                    child: Text(titleText.trim(), style: Styles.textBoldStyle)),
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
                    Text(colorText,
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
                            text: StringResources.prices.tr(context),
                            style: Styles.textBoldStyle,
                            children: [
                              TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                            ]),
                        TextSpan(
                            text: '\u{20B9}',
                            style: Styles.textStyle2
                                .copyWith(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: amount,
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
                          onTap: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _controller.decrementQty(index);
                            });
                          },
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
                            // cursorColor: UIColors.bgColor,
                            style: Styles.textStyle.copyWith(
                                fontSize: UIDimens.size15,
                                color: UIColors.primaryColor),
                            decoration: const InputDecoration(
                              fillColor: UIColors.whiteColor,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: UIColors.whiteColor),
                              ),
                              contentPadding: EdgeInsets.all(UIDimens.size2),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            // controller: _controller.controllerQty,
                            controller: _controller.controllerQty[index],
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: false,
                              signed: true,
                            ),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(3),
                            ],
                            onFieldSubmitted: (value) {
                              setState(() {
                                _controller.updateQty(index);
                              });
                            }),
                      ),
                    ),
                    SizedBox(
                      width: UIDimens.size25,
                      height: UIDimens.size25,
                      child: GestureDetector(
                          onTap: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                              _controller.incrementQty(index);
                            });
                          },
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
                        _controller.deleteQuoteItem(quoteItemId.toString());
                      });

                      print(quoteItemId.toString());
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _generateEmptyCart() {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * UIDimens.padding75,
          // margin: const EdgeInsets.only(left: 30),
          decoration: const BoxDecoration(
              // color: Colors.grey[800],
              ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    _controller.isfirst == false
                        ? "Loading..."
                        : "Your Cart is Empty",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.0,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
