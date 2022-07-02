import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/custom_locale.dart';

class Utils {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static List<Locale> localeFromCustomLocale(List<CustomLocale> customLocales) {
    List<Locale> locales = [];
    customLocales.forEach((locale) {
      locales.add(locale.locale!);
    });
    return locales;
  }

  static String formatDate(String dateTime, String dateFormat) {
    String formattedDate = "";
    if (dateTime != null || dateTime == "") {
      DateTime dt = DateTime.parse(dateTime);
      formattedDate = new DateFormat(dateFormat).format(dt);
    } else {
      formattedDate = new DateFormat(dateFormat).format(DateTime.now());
    }

    return formattedDate;
  }

  static List<dynamic> formatPrecision(String value) {
    double newVal = 0.00;
    newVal = double.parse(value);
    String precision = "00";
    String value1 = "0";
    List<dynamic> data = [];
    var formatter = NumberFormat('#,##,##0.00');

    precision = newVal.toStringAsFixed(2).split('.')[1].substring(0, 2);
    value1 = newVal.toInt().toString();
    data.add(value1);
    data.add(precision);

    print("value1 " + data[0].toString());
    print("value2 " + data[1].toString());
    return data;
  }
}
