import 'package:dee_pee_ink/ui_utils/ui_dimens.dart';
import 'package:flutter/material.dart';

class CommonIcon extends StatelessWidget {
  const CommonIcon(
      {required this.path,
      required this.onPressed,
      this.size = UIDimens.size25,
      Key? key})
      : super(key: key);

  final String path;
  final Function onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.all(UIDimens.padding),
        child: Image.asset(
          path,
          width: size,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
