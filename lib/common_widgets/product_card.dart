import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/string_resources.dart';
import '../model/product_list_response.dart';
import '../ui_utils/styles.dart';
import '../ui_utils/ui_dimens.dart';
import '../utils/app_constants.dart';

class ProductCard extends StatelessWidget {
  ProductCard(this.product);

  Products product;
  var formatter = NumberFormat('#,##,##0.00');
  @override
  Widget build(BuildContext context) {
    print(product.pictures);
    return Container(
      padding: const EdgeInsets.all(UIDimens.size5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(UIDimens.size20),
              ),
              padding: const EdgeInsets.all(UIDimens.size5),
              child: Stack(
                fit: StackFit.loose,
                children: [
                  product.pictures?.isNotEmpty ?? false
                      ? Image.network(
                          product.pictures![0].url ??
                              AppConstants.defaultImage,
                          fit: BoxFit.scaleDown,
                        )
                      : Image.network(
                          AppConstants.defaultImage,
                          fit: BoxFit.scaleDown,
                        ),
                ],
              )),
          Wrap(children: [
            Text(
              product.name.toString().trim(),
              style: Styles.textStyle2,
              overflow: TextOverflow.clip,
            ),
          ]),
          Text.rich(TextSpan(
              text: '\u{20B9}',
              style: Styles.textStyle3.copyWith(fontSize: UIDimens.size16),
              children: [
                TextSpan(text: formatter.format(product.approxPrice)),
              ])),
          Text(
            StringResources.approx.tr(context),
            style: Styles.textStyle2.copyWith(fontSize: UIDimens.size12),
          ),
        ],
      ),
    );
  }
}
