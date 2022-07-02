import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/common_widgets/string_extensions.dart';
import 'package:dee_pee_ink/model/feature_product_response.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:dee_pee_ink/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants/string_resources.dart';
import '../../ui_utils/styles.dart';

class FeatureProductCard extends StatelessWidget {
   FeatureProductCard( this.product);
   Product product;
   var formatter = NumberFormat('#,##,##0.00');
  @override
  Widget build(BuildContext context) {
    //debugPrint("quote status ${product.pictures?.first.pictureImageUrl}");
    return Container(
      padding: const EdgeInsets.all(UIDimens.size5),
      child: Column(
        children: [
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(UIDimens.size5),
                height: UIDimens.size230,
                decoration: BoxDecoration(
                  color: UIColors.whiteColor,
                  borderRadius: BorderRadius.circular(UIDimens.size20),
                ),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    product.pictures?.isNotEmpty ?? false
                        ? Image.network(
                      product.pictures?.first.pictureImageUrl ??
                          AppConstants.defaultImage,
                      fit: BoxFit.scaleDown,
                    )
                        : Image.network(
                      AppConstants.defaultImage,
                      fit: BoxFit.scaleDown,
                    ),
                  ],
                )),
          ),
          const Space(
            isSmall: true,
          ),
          Text(
            product.name.toString().trim(),
            style: Styles.textStyle2,
            overflow: TextOverflow.clip,
          ),
          const Space(
            isSmall: true,
          ),
          Text.rich(TextSpan(
              text: StringResources.approx.tr(context),
              style: Styles.textStyle3,
              children: [
                TextSpan(text: StringResources.colon.tr(context),style: Styles.textStyle2),
                TextSpan(
                  text: '\u{20B9}',
                  style: Styles.textStyle.copyWith(fontSize: UIDimens.size18),
                ),
                TextSpan(
                    text: formatter.format(product.approxPrice),
                    style: Styles.textStyle3.copyWith(fontSize: UIDimens.size18)),
              ]))
        ],
      ),
    );
  }
}
