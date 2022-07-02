import 'package:dee_pee_ink/common_widgets/space.dart';
import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key, required this.text, required this.headerText})
      : super(key: key);
  final String headerText, text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(headerText, style: Styles.textBoldStyle),
        const Space(
          isSmall: true,
        ),
        HtmlWidget(text),
        const Space(
          custom: UIDimens.size20,
        )
      ],
    );
  }
}
