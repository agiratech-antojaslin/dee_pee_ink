import 'package:flutter/material.dart';

class AppConstants {
  static const String defaultImage =
      'https://se-source.com/wp-content/uploads/2022/01/default_product.jpg';

  static List<Locale> supportedLocals = [Locale('en', 'EN')];

  static const String clientSecretKey =
      "ck_16aa7b878d9d72f5519e524251e6e7d3215f1969";
  static const String clientSecretPass =
      "cs_8930296a858036fd03ec0fe57fcf3fe5706156fa";
}

class ApiConstants {
  static const String login = "jwt-auth/v1/token";
  static const String dpLogin = "api/login";
  static const String dpSignUp = 'api/users/';

  // static const String signup = "wp/v2/users/register";
  static const String sendOtp = "wp/v2/users/mobile-otp/send";
  static const String forgotPassword = "/api/users/forgot_password";
  static const String resetPassword = "/api/users/reset_password";
  static const String updatePassword = "/api/users/update_password";
  static const String resendOTP = "/api/users/resend_verify_otp";
  static const String checkPincode = "woostore/addresses/v1/valid/pincode";

  static const String uploadImage = "/api/user_profiles/upload_image";

  static const String productsList = 'api/products/search';
  static const String categoriesList = '/api/products/categories';
  static const String productsDetail = 'api/products/';
  static const String featuredProducts = '/api/products/featured_products';
  static const String resendOtp = 'api/users/resend_verify_otp';
  static const String verifyOtp = 'api/users/verify_otp';

  static const String addQuoteItems = 'api/quotes/';
  static const String requestQuote = 'api/quotes/request_quote';
  static const String viewQuoteItems = 'api/quotes/\$id';
  static const String deleteQuoteItems = 'api/quote_items/\$id';
  static const String editQuoteItems = 'api/quotes/\$id';
  static const String listQuoteItems = 'api/quotes/search';
  static const String acceptQuote = 'api/quotes/accept';
  static const String denyQuote = 'api/quotes/deny';
  static const String downloadQuote = '/api/quotes/download_quote/\$id';

  static const String profile = 'api/user_profiles/';
  static const String createAddress = '/api/user_profiles/create_addresses';
  static const String listAddress = '/api/user_profiles/addresses';
  static const String deleteQuoteItemsNew = 'api/quotes/quote_items';
  static const String orderConfirm = 'api/orders/\$id';
  static const String paymentUpdate = 'api/order/update_payment';
  static const String updateAddress = '/api/user_profiles/update_addresses';
  static const String deleteAddress = 'api/user_profiles/delete_address';

  static const String defaultImage =
      'https://se-source.com/wp-content/uploads/2022/01/default_product.jpg';

  static List<Locale> supportedLocals = [Locale('en', 'EN')];

  static const String clientSecretKey =
      "ck_16aa7b878d9d72f5519e524251e6e7d3215f1969";
  static const String clientSecretPass =
      "cs_8930296a858036fd03ec0fe57fcf3fe5706156fa";
}
