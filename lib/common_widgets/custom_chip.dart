import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class CommonChip extends StatelessWidget {
  const CommonChip(
      {Key? key,
      required this.title,
      required this.isEnabled,
      required this.onPressed})
      : super(key: key);
  final String title;
  final bool isEnabled;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        decoration: BoxDecoration(
            color: isEnabled ? UIColors.primaryColor : UIColors.bgColor,
            borderRadius: BorderRadius.circular(UIDimens.size10),
            border: Border.all(
                width: 2,
                color:
                    isEnabled ? UIColors.primaryColor : Colors.grey)),
        padding: const EdgeInsets.symmetric(
            vertical: UIDimens.size10, horizontal: UIDimens.size15),
        child: Text(
          title,
          style: Styles.textStyle
              .copyWith(color: isEnabled ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
