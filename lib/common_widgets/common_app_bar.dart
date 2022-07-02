import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
    this.title,
    this.backgroundColor,
    this.automaticallyImplyLeading,
    this.icon,
  }) : super(key: key);

  final String? title;
  final Color? backgroundColor;
  final Widget? icon;
  final bool? automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          // if (title != null)
          Text(title!.toString(),
              style: Styles.textBoldStyle.copyWith(color: UIColors.greyColor)),
      //   ],
      // ),
      centerTitle: true,
      elevation: UIDimens.size2,
      iconTheme: const IconThemeData(color: UIColors.blackColor),
      automaticallyImplyLeading: automaticallyImplyLeading!,
      backgroundColor: backgroundColor ?? UIColors.bgColor,
      actions: [if (icon != null) IconButton(onPressed: () {}, icon: icon!)],
    );
  }
}
