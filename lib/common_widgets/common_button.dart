import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color,
    this.padding,
  }) : super(key: key);

  final String? text;
  final Padding? padding;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UIDimens.size8)),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text!,
          style: Styles.textStyle2.copyWith(color: Colors.white),
        ),
      ),
      padding: const EdgeInsets.all(UIDimens.size10),
      color: color ?? UIColors.primaryColor,
    );
  }
}
