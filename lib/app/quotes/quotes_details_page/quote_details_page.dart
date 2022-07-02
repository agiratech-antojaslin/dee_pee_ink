import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common_widgets/common_icon.dart';
import '../../../common_widgets/space.dart';
import '../../../controllers/quote_accept_deny_controller.dart';
import '../../../model/list_quote_response.dart';
import '../../../routing/route_constants.dart';
import '../../../ui_utils/assets.dart';
import '../../../ui_utils/styles.dart';
import '../../../ui_utils/ui_colors.dart';
import '../../../utils/app_constants.dart';
import 'quotes_details_card.dart';

class QuoteDetailsPage extends StatefulWidget {
  QuoteDetailsPage({
    Key? key,
    this.pictures,
    this.quoteList,
    this.orderNo,
    this.orderId, this.product,
  }) : super(key: key);
  final Product? product;
  final Pictures? pictures;
  final Quotes? quoteList;
  final String? orderNo;
  final String? orderId;

  @override
  State<QuoteDetailsPage> createState() => _QuoteDetailsPageState();
}

class _QuoteDetailsPageState extends State<QuoteDetailsPage> {
  late QuoteAcceptDenyScreenController _controller;
  var formatter = NumberFormat('#,##,##0.00');

  @override
  void initState() {
    super.initState();
    _controller = QuoteAcceptDenyScreenController();
    _controller.addListener(_listener);
    _controller.init(context,widget.orderId);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _listener() {
    setState(() {});
  }

  Future<bool> _onBackPressed() async {
    Navigator.of(context).pop(true);
    print(true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("quote status ${widget.quoteList?.quoteStatus?.name.toString()}");
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
                  title: Text(StringResources.quoteDetails.tr(context),
                      style: Styles.textBoldStyle
                          .copyWith(color: UIColors.greyColor)),
                ),
                bottomNavigationBar: widget.quoteList!.quoteStatus?.name == "Responded"
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: UIDimens.size15,
                            vertical: UIDimens.size15),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(UIDimens.size15),
                                    color: UIColors.primaryColor),
                                child: TextButton(
                                    child: Text(
                                      StringResources.denyQuote.tr(context),
                                      style: Styles.textBoldStyle
                                          .copyWith(color: UIColors.bgColor),
                                    ),
                                    onPressed: () async {
                                      bool result = await _controller.denyQuote(
                                          widget.quoteList!.id.toString());
                                      if (result) {
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          Navigator.pop(context);
                                          Navigator.of(context).pop(true);
                                        });
                                      }
                                    }),
                              ),
                              const Space(isSmall: true),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(UIDimens.size15),
                                    color: UIColors.primaryColor),
                                child: TextButton(
                                    child: Text(
                                      StringResources.payment.tr(context),
                                      style: Styles.textBoldStyle
                                          .copyWith(color: UIColors.bgColor),
                                    ),
                                    onPressed: () async {
                                      // bool result = await _controller
                                      //     .acceptQuote(widget.quoteList!.id.toString());
                                      bool result =
                                          await _controller.acceptQuote(
                                              widget.quoteList!.id.toString());
                                      if (result) {
                                        Future.delayed(Duration(seconds: 2),
                                            () {
                                          Navigator.pushNamed(context,
                                              RouteConstants.billingAddress);
                                        });
                                      }
                                    }),
                              ),
                            ]),
                      )
                    : widget.quoteList!.order?.orderStatus == "Delivered"
                    ? const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIDimens.size15,
                      vertical: UIDimens.size15),
                ):widget.quoteList!.order?.orderStatus == "Confirmed"
                    ? const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIDimens.size15,
                      vertical: UIDimens.size15),
                )
                    :widget.quoteList!.order?.orderStatus == "Partially Paid"
                    ? const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIDimens.size15,
                      vertical: UIDimens.size15),
                ) :
                    widget.quoteList!.order?.orderStatus == "Payment Received"
                    ? const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIDimens.size15,
                      vertical: UIDimens.size15),
                ):widget.quoteList!.quoteStatus?.name == "Accepted"
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: UIDimens.size15,
                      vertical: UIDimens.size15),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:
                          MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  UIDimens.size15),
                              color: UIColors.primaryColor),
                          child: TextButton(
                              child: Text(
                                StringResources.continueToPay
                                    .tr(context),
                                style: Styles.textBoldStyle
                                    .copyWith(
                                    color:
                                    UIColors.bgColor),
                              ),
                              onPressed: ()async {
                                debugPrint("quoteID ${widget.quoteList?.order?.id.toString()}");
                                // bool result = await _controller
                                //     .acceptQuote(widget.quoteList!.id.toString());
                                String? result =
                                    widget.quoteList?.order?.id.toString();
                                await(AppPreferences.setCurOrderId(result!));
                                debugPrint(result);
                                Future.delayed(Duration(seconds: 2),
                                        () {
                                      Navigator.pushNamed(context,
                                          RouteConstants.billingAddress);
                                    });
                              }),
                        ),
                      ]),
                )
                    : const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: UIDimens.size15,
                      vertical: UIDimens.size15),
                ),
                body: Stack(
                  children: [
                    SingleChildScrollView(
                        child: Column(
                      children: [
                        const SizedBox(height: UIDimens.size10),
                        Order(
                          quoteNo: widget.quoteList!.code,
                          orderNo: widget.quoteList?.order?.code,
                          // orderDate: '24/02/2022',
                          orderStatus: widget.quoteList!.order?.orderStatus,
                          quoteStatus: widget.quoteList!.quoteStatus?.name,
                        ),
                        const Space(isSmall: true),
                        const Divider(
                            color: UIColors.blackColor,
                            endIndent: 15,
                            indent: 15),
                        const Space(isSmall: true),
                        Text(
                          StringResources.product.tr(context),
                          style: Styles.subTitleStyle,
                        ),

                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return QuoteDetailsCard(
                              image: widget.quoteList!.quoteItems![index].product?.pictures?.first.url.toString() ?? AppConstants.defaultImage,
                              titleText: widget
                                  .quoteList!.quoteItems![index].product?.name,
                              items: (widget.quoteList!.quoteItems![index]
                                          .product?.unit?.volume)
                                      .toString() +
                                  " " +
                                  (widget.quoteList!.quoteItems![index].product
                                          ?.unit?.name)
                                      .toString(),
                              amount: formatter.format(widget.quoteList!
                                  .quoteItems![index].product!.approxPrice),
                              colorText: widget
                                  .quoteList!.quoteItems![index].color?.name,
                              quantity: widget
                                  .quoteList!.quoteItems![index].quantity
                                  .toString(),
                              offerPrice: widget.quoteList!.quoteItems![index]
                                          .offerPrice
                                          .toString() !=
                                      "null"
                                  ? formatter.format(widget
                                      .quoteList!.quoteItems![index].offerPrice)
                                  : widget
                                      .quoteList!.quoteItems![index].offerPrice
                                      .toString(),
                            );
                          },
                          itemCount: widget.quoteList?.quoteItems!.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                        ),

                        // const QuoteDetailsCard(
                        //   image: "assets/temp/temp2.jpg",
                        //   titleText: "VideoJet cartridge",
                        //   items: "250 ml",
                        //   amount: "1200",
                        //   colorText: "Red, Blue",
                        //   quantity: "5",
                        // ),
                        // const QuoteDetailsCard(
                        //   image: "assets/temp/temp1.jpg",
                        //   titleText: "Printer Ink cartridge",
                        //   amount: "1200",
                        //   items: "4 Pieces",
                        //   colorText: "Red, Blue",
                        //   quantity: "100",
                        // ),
                        const Space(isSmall: true),
                        // Text(
                        //   StringResources.payment.tr(context),
                        //   style: Styles.textStyle4,
                        // ),
                        // const InvoiceDetails(
                        //   paymentReceived: "02/03/2022 5:00 PM",
                        //   transactionId: "TR345983456B4F34",
                        //   paymentMethod: "Online",
                        //   paymentStatus: "Success",
                        // ),
                        const Divider(
                            color: UIColors.blackColor,
                            endIndent: 15,
                            indent: 15),
                        totalAmount(context),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    )),

                  ],
                ))));
  }

  Padding totalAmount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: UIDimens.size15),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       StringResources.subTotal.tr(context),
          //       style: Styles.greyTextStyle,
          //     ),
          //     const Text.rich(TextSpan(children: [
          //       TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
          //       TextSpan(
          //         text: "5200",
          //         style: Styles.subTitleStyle,
          //       )
          //     ])),
          //   ],
          // ),
          // const Space(
          //   custom: UIDimens.size5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       StringResources.taxDetails.tr(context),
          //       style: Styles.greyTextStyle,
          //     ),
          //     const Text.rich(TextSpan(children: [
          //       TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
          //       TextSpan(
          //         text: "150",
          //         style: Styles.subTitleStyle,
          //       )
          //     ])),
          //   ],
          // ),
          // const Space(
          //   custom: UIDimens.size5,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       StringResources.shipping.tr(context),
          //       style: Styles.greyTextStyle,
          //     ),
          //     const Text.rich(TextSpan(children: [
          //       TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
          //       TextSpan(
          //         text: "200",
          //         style: Styles.subTitleStyle,
          //       )
          //     ])),
          //   ],
          // ),
          // const Space(
          //   custom: UIDimens.size5,
          // ),
          if (widget.quoteList!.subTotal != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringResources.subTotal.tr(context),
                  style: Styles.textBoldStyle,
                ),
                Text.rich(TextSpan(children: [
                  const TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                  TextSpan(
                    text: formatter.format(widget.quoteList!.subTotal),
                    style: Styles.subTitleStyle,
                  )
                ])),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringResources.cgstTotal.tr(context),
                style: Styles.textBoldStyle,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                TextSpan(
                  text: formatter.format(widget.quoteList!.cgstAmount),
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
                style: Styles.textBoldStyle,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                TextSpan(
                  text: formatter.format(widget.quoteList!.sgstAmount),
                  style: Styles.subTitleStyle,
                )
              ])),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringResources.total.tr(context),
                style: Styles.textBoldStyle,
              ),
              Text.rich(TextSpan(children: [
                const TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                TextSpan(
                  text: formatter.format(widget.quoteList!.totalApproxAmount),
                  style: Styles.subTitleStyle,
                )
              ])),
            ],
          ),
          if (widget.quoteList!.totalAmount != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringResources.totalOfferPrice.tr(context),
                  style: Styles.textBoldStyle,
                ),
                Text.rich(TextSpan(children: [
                  const TextSpan(text: '\u{20B9}', style: Styles.subTitleStyle),
                  TextSpan(
                    text: widget.quoteList!.totalAmount?.toString() != "null"
                        ? formatter.format(widget.quoteList!.totalAmount)
                        : widget.quoteList!.totalAmount?.toString(),
                    style: Styles.subTitleStyle,
                  )
                ])),
              ],
            ),
        ],
      ),
    );
  }
}

class Order extends StatelessWidget {
  Order(
      {Key? key,
      this.quoteNo,
      this.orderNo,
      this.orderDate,
      this.orderStatus,
      this.quoteStatus})
      : super(key: key);

  final String? quoteNo;
  final String? orderNo;
  final String? orderDate;
  final String? orderStatus;
  final String? quoteStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: UIDimens.size15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (quoteNo != null)
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: StringResources.quoteNo.tr(context),
                            style: Styles.textStyle4,
                          ),
                          TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                        ],
                      ),
                    ),
                    Text(quoteNo!, style: Styles.greyTextStyle),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: UIDimens.size3),
        if (orderNo != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: UIDimens.size15),
            child: Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: StringResources.orderNo.tr(context),
                    style: Styles.textStyle4,
                  ),
                  TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                ])),
                Text(
                  orderNo!,
                  style: Styles.greyTextStyle,
                )
              ],
            ),
          ),
        const SizedBox(height: UIDimens.size3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: UIDimens.size15),
          child: Column(
            children: [
              if (orderDate != null)
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: StringResources.orderDate.tr(context),
                            style: Styles.textStyle4,
                          ),
                          TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2)
                        ],
                      ),
                    ),
                    Text(orderDate!, style: Styles.greyTextStyle),
                  ],
                ),
              const SizedBox(height: UIDimens.size3),
              if (orderStatus != null)
                Row(
                  children: [
                    Text(
                      StringResources.orderStatus.tr(context),
                      style: Styles.textStyle4,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: StringResources.colon.tr(context),
                          style: Styles.textStyle2),
                      TextSpan(text: orderStatus!, style: Styles.greyTextStyle)
                    ])),
                  ],
                ),
              const SizedBox(height: UIDimens.size3),
              if (quoteStatus != null)
                Row(
                  children: [
                    Text(
                      StringResources.quoteStatus.tr(context),
                      style: Styles.textStyle4,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: StringResources.colon.tr(context),
                          style: Styles.textStyle2),
                      TextSpan(text: quoteStatus!, style: Styles.greyTextStyle)
                    ])),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
