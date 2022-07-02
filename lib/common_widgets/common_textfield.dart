import 'package:dee_pee_ink/ui_utils/styles.dart';
import 'package:dee_pee_ink/ui_utils/ui_colors.dart';
import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.onChanged,
    this.obscureText,
    this.suffix,
    this.controller,
    this.borderColor,
    this.maxLength,
    this.borderRadius,
    this.keyboardType,
    required this.focusNode,
    this.labelText,
    this.enabled,
    this.readOnly = false,
  }) : super(key: key);

  final String? hintText;
  final String? labelText;
  final IconData? icon;
  final bool? obscureText;
  final bool? enabled;
  final Widget? suffix;
  final Color? borderColor;
  final double? borderRadius;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int? maxLength;
  final bool readOnly ;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    print(focusNode!.hasFocus);
    print(focusNode!.hasPrimaryFocus);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: UIDimens.size10),
      decoration: BoxDecoration(
          color: UIColors.bgColor,
          borderRadius: BorderRadius.circular(UIDimens.size10),
          border: Border.all(
              color: focusNode!.hasFocus ? UIColors.primaryColor : Colors.grey,
              width: 2)),
      child: TextField(
        readOnly: readOnly,
        enabled: enabled,
        keyboardType: keyboardType ?? TextInputType.text,
        obscureText: obscureText ?? false,
        controller: controller,
        style: Styles.textStyle2,
        onChanged: onChanged,
        cursorColor: Colors.black,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ],
        decoration: InputDecoration(
            labelText: labelText,
            icon: Icon(
              icon,
              color: UIColors.primaryColor,
            ),
            hintText: hintText,
            hintStyle: Styles.textStyle2,
            suffixIcon: suffix,
            border: InputBorder.none),
      ),
    );
  }
}
