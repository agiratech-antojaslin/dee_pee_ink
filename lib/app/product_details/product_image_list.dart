import 'package:dee_pee_ink/model/product_details_response.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class ProductImageList extends StatefulWidget {
  const ProductImageList({Key? key, required this.pictures}) : super(key: key);
  final List<Pictures> pictures;

  @override
  _ProductImageListState createState() => _ProductImageListState();
}

class _ProductImageListState extends State<ProductImageList> {
  PageController? _pageController;
  int initialPage = 1;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 0.98,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemCount: widget.pictures.length,
            itemBuilder: (context, index) => ProductItem(
              image: widget.pictures[index].url,
            ),
          ),
        ),
        widget.pictures.length > 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                      widget.pictures.length,
                      (index) => Indicator(
                            isActive: _selectedIndex == index ? true : false,
                          ))
                ],
              )
            : Container()
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final bool? isActive;

  const Indicator({
    Key? key,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: UIDimens.size4),
      width: isActive! ? UIDimens.size8 : UIDimens.size8,
      height: UIDimens.size8,
      decoration: BoxDecoration(
          color: isActive! ? UIColors.primaryColor : UIColors.greyColor,
          borderRadius: BorderRadius.circular(UIDimens.size8)),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, this.image}) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: UIDimens.size20, vertical: UIDimens.size10),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Image.network(
          image!,
          fit: BoxFit.fill,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIDimens.size20),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(UIDimens.size10),
      ),
    );
  }
}
