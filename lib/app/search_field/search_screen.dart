import 'package:dee_pee_ink/common_widgets/common_icon.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/constants/string_resources.dart';
import 'package:dee_pee_ink/controllers/search_screen_controller.dart';
import 'package:dee_pee_ink/ui_utils/assets.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/product_card.dart';
import '../product_details/product_details_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  late SearchScreenController _controller;

  @override
  void initState() {
    _controller = SearchScreenController();
    _controller.init(context);
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: UIColors.bgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(UIDimens.size15),
              child: Card(
                elevation: UIDimens.size2,
                child: TextField(
                  controller: _controller.searchFieldController,
                  decoration: InputDecoration(
                    prefixIcon: CommonIcon(
                      path: Assets.back,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      size: 2,
                    ),
                    suffixIcon: CommonIcon(
                        path: Assets.search,
                        onPressed: () {
                          if (_controller.searchFieldController.text
                              .trim()
                              .isNotEmpty) {
                            _controller.submitSearch();
                          }
                        }),
                    border: InputBorder.none,
                    hintText: StringResources.searchItems.tr(context),
                  ),
                ),
              ),
            ),
            if (_controller.products.isEmpty && !_controller.isLoading)
              Text("There are no products for given keyword"),
            if (_controller.products.isNotEmpty)
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.2,
                child: GridView.builder(
                  primary: false,
                  itemCount: _controller.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    print(index);
                    print(index);
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      id: (_controller.products[index].id
                                          as int))));
                        },
                        child: ProductCard(_controller.products[index]));
                  },
                ),
              )
          ],
        ),
      ),
    ));
  }
}
