import 'package:flutter/cupertino.dart';

class Space extends StatelessWidget {
  const Space({Key? key, this.isSmall = false, this.custom = 0})
      : super(key: key);
  final bool isSmall;
  final double custom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: custom != 0 ? custom : (isSmall ? 10 : 20),
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({Key? key, this.isSmall = false}) : super(key: key);
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isSmall ? 5 : 20,
    );
  }
}
