class ValidationUtils {
  static bool isEmail(String email) {
    String emailValidationRule =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailValidationRule);
    return regExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    String passwordValidationRule =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

    /* String passwordValidationRule =
        "^(?=.*[A-Z])(?=.*[a-z])^(?=.*[0-9\\!\\@\\.\\<\\>\\-_#\$%\\^&\\*])(?=.{7,})";*/
    RegExp regExp = RegExp(passwordValidationRule);
    return regExp.hasMatch(password);
  }

  static bool isValidStringValue(String name) {
    Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
    RegExp regExp = RegExp(pattern as String);
    bool res = regExp.hasMatch(name);
    return res;
  }

  static bool isValidZipcode(String value, int count) {
    return value.isNotEmpty && value.length == count;
  }

  static bool isvalidMobile(String value, int count) {
    String patttern = r'(^(?:[+0]9)?[0-9]{8,12}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return value.length >= count;
  }

  static bool isValidNumberValue(number) {
    Pattern pattern = r'[a-z]';
    RegExp regExp = RegExp(pattern as String);
    return regExp.hasMatch(number);
  }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
