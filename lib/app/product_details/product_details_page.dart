import 'package:dee_pee_ink/app/product_details/product_image_list.dart';
import 'package:dee_pee_ink/app/product_details/product_list.dart';
import 'package:dee_pee_ink/app/quotes/add_to_quote.dart';
import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/products_detail_controller.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({required this.id});

  final int id;

  // const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductDetailScreenController _controllerProduct;

  @override
  void initState() {
    super.initState();
    _controllerProduct = ProductDetailScreenController();
    _controllerProduct.addListener(_listener);
    _controllerProduct.init(context, widget.id);
    _controllerProduct.qtyController.text = "1";
  }

  @override
  void dispose() {
    super.dispose();
    _controllerProduct.dispose();
  }

  void _listener() {
    setState(() {});
  }

  String? _chosenValue;
  var formatter = NumberFormat('#,##,##0.00');
  Future<bool> _onBackPressed() async {
    Navigator.of(context).pop(true);
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
                title: Text(StringResources.details.tr(context),
                    style: Styles.textBoldStyle
                        .copyWith(color: UIColors.greyColor)),
              ),
              backgroundColor: UIColors.bgColor,
              bottomNavigationBar: AddToQuote(
                total: _controllerProduct.total,
                colorId: _controllerProduct.selectColorID,
                productId: _controllerProduct.procductID.toString(),
                quantity: _controllerProduct.qtyController.text,
              ),
              body: Stack(children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Space(
                          isSmall: true,
                        ),
                        _header,
                        ProductImageList(pictures: _controllerProduct.pictures),
                        //_productImageCard,
                        //_productPreview,
                        const Space(),
                        _price,
                        const Space(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: UIDimens.size20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(StringResources.color.tr(context),
                                      style: Styles.textStyle2),
                                  DropdownButton<String>(
                                    underline: Container(),
                                    value: _chosenValue,
                                    style: const TextStyle(color: Colors.black),
                                    items: _controllerProduct.productColors
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      StringResources.chooseTheColor
                                          .tr(context),
                                      style: Styles.textStyle,
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _chosenValue = value;
                                        _controllerProduct
                                            .selectedColorPosition(
                                                value.toString());
                                        print(_chosenValue);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    StringResources.quantity.tr(context),
                                    style: Styles.textStyle2,
                                  ),
                                  const Space(
                                    isSmall: true,
                                  ),
                                  _numberInputWithIncrementDecrement,
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Space(isSmall: true),
                        const Divider(
                          indent: 25,
                          endIndent: 25,
                          color: UIColors.greyColor,
                          thickness: 1,
                        ),
                        const Space(),
                        _productDetails,
                      ]),
                ),
              ]),
            )));
  }

  Widget get _numberInputWithIncrementDecrement => Container(
        foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UIDimens.size8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: UIDimens.size35,
              height: UIDimens.size35,
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    _controllerProduct.decrementQty();
                  },
                  child: Image.asset(
                    "assets/icons/minus.png",
                    color: UIColors.blackColor,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: UIDimens.size3),
              child: Container(
                color: UIColors.whiteColor,
                width: UIDimens.size50,
                height: UIDimens.size40,
                foregroundDecoration: BoxDecoration(
                  border: Border.all(
                    color: UIColors.whiteColor,
                  ),
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle.copyWith(
                      fontSize: UIDimens.size20, color: UIColors.primaryColor),
                  decoration: const InputDecoration(
                    fillColor: UIColors.whiteColor,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: UIColors.whiteColor),
                    ),
                    contentPadding: EdgeInsets.all(UIDimens.size5),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  controller: _controllerProduct.qtyController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  onFieldSubmitted: (value) {
                    _controllerProduct.updateQty();
                  },
                ),
              ),
            ),
            SizedBox(
              width: UIDimens.size35,
              height: UIDimens.size35,
              child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    _controllerProduct.incrementQty();
                  },
                  child: Image.asset(
                    "assets/icons/add.png",
                    color: UIColors.blackColor,
                  )),
            ),
          ],
        ),
      );

  Widget get _header => Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_controllerProduct.procductName, style: Styles.subTitleStyle),
          ],
        ),
      );

  Widget get _price => Center(
        child: Text.rich(TextSpan(
            text: StringResources.approx.tr(context),
            style: Styles.textStyle2,
            children: [
              TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2),
              TextSpan(
                  text: '\u{20B9}',
                  style: Styles.textStyle.copyWith(fontSize: UIDimens.size20)),
              TextSpan(
                  text: formatter.format(_controllerProduct.approxPrice),
                  style: Styles.textStyle3.copyWith(fontSize: UIDimens.size20)),
              TextSpan(text: ("/ " + _controllerProduct.unitName.toString()))
            ])),
      );

  Widget get _productDetails => Column(
        children: [
          Text(StringResources.productDetails.tr(context),
              style: Styles.textBoldStyle),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: UIDimens.size30, vertical: UIDimens.size20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Space(
                    isSmall: true,
                  ),
                  ProductList(
                    headerText: StringResources.brand.tr(context),
                    text: _controllerProduct.brandName,
                  ),
                  ProductList(
                      headerText: StringResources.productCode.tr(context),
                      text: _controllerProduct.productCode),
                  ProductList(
                      headerText: StringResources.highlights.tr(context),
                      text: _controllerProduct.productHighlight),
                  ProductList(
                    headerText: StringResources.description.tr(context),
                    text: _controllerProduct.productDescription,
                  )
                ],
              ),
            ),
          ),
        ],
      );
}
