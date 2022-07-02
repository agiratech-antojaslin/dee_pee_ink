import 'package:flutter/cupertino.dart';

import '../locale/app_localization.dart';

extension StringExtension on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)?.translate(this) ?? '';
  }
}
