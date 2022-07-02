import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/common_icon.dart';
import '../../common_widgets/product_card.dart';
import '../../constants/string_resources.dart';
import '../../controllers/all_products_controller.dart';
import '../../ui_utils/assets.dart';
import '../../ui_utils/styles.dart';
import '../../ui_utils/ui_dimens.dart';
import '../product_details/product_details_page.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  late AllProductsController _controller;

  @override
  void initState() {
    _controller = AllProductsController();
    _controller.init(context);
    _controller.addListener(_listener);
    super.initState();
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
                title: Text(StringResources.allProducts.tr(context),
                    style: Styles.textBoldStyle
                        .copyWith(color: UIColors.greyColor)),
              ),
              backgroundColor: UIColors.bgColor,
              body: Stack(children: [
                SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.90,
                      child: _controller.products.length > 1
                          ? GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 1.0,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetails(
                                                      id: (_controller
                                                          .products[index]
                                                          .id as int))));
                                    },
                                    child: ProductCard(
                                        _controller.products[index]));
                              },
                              itemCount: _controller.products.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                            )
                          : Container(),
                    ),
                  ],
                )),
              ]),
            )));
  }
}
