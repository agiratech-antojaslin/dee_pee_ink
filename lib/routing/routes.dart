import 'package:dee_pee_ink/app/Admin/admin_quote_response.dart';
import 'package:dee_pee_ink/app/account_details/account_details.dart';
import 'package:dee_pee_ink/app/account_details/add_new_default_billing_address.dart';
import 'package:dee_pee_ink/app/account_details/add_new_default_shipping_address.dart';
import 'package:dee_pee_ink/app/account_details/change_address.dart';
import 'package:dee_pee_ink/app/account_details/default_billing_address.dart';
import 'package:dee_pee_ink/app/account_details/default_shipping_address.dart';
import 'package:dee_pee_ink/app/account_details/edit_address.dart';
import 'package:dee_pee_ink/app/authentication/account_verification_page.dart';
import 'package:dee_pee_ink/app/authentication/forgot_password/forgot_password.dart';
import 'package:dee_pee_ink/app/authentication/login_screen.dart';
import 'package:dee_pee_ink/app/authentication/sign_up_screen.dart';
import 'package:dee_pee_ink/app/cart_details/cart_details_page.dart';
import 'package:dee_pee_ink/app/payment/address/add_new_billing_address.dart';
import 'package:dee_pee_ink/app/payment/address/add_new_shipping_address.dart';
import 'package:dee_pee_ink/app/payment/check_out_page.dart';
import 'package:dee_pee_ink/app/product_details/product_details_page.dart';
import 'package:dee_pee_ink/app/quotes/quote_response/quote_response_page.dart';
import 'package:dee_pee_ink/app/payment/address/billing_address.dart';
import 'package:dee_pee_ink/app/quotes/quotes_details_page/quote_details_page.dart';
import 'package:dee_pee_ink/app/search_field/search_screen.dart';
import 'package:dee_pee_ink/app/settings/change_password.dart';
import 'package:dee_pee_ink/app/settings/settings.dart';
import 'package:dee_pee_ink/app/splash_screen.dart';
import 'package:dee_pee_ink/model/update_address_response.dart';
import 'package:dee_pee_ink/routing/route_param_constants.dart';
import 'package:flutter/material.dart';

import '../app/authentication/forgot_password/new_password.dart';
import '../app/home/all_products.dart';
import '../app/home/home_screen.dart';
import '../routing/route_constants.dart';

class Routes {
  MaterialPageRoute<dynamic>? route(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initial:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case RouteConstants.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouteConstants.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());
      case RouteConstants.home:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RouteConstants.search:
        return MaterialPageRoute(builder: (context) => SearchScreen());
      case RouteConstants.allProducts:
        return MaterialPageRoute(builder: (context) => const AllProducts());
      case RouteConstants.editAddress:
        final dynamic data = settings.arguments;
        print("address id is ${data["address"].id}");
        return MaterialPageRoute(
            builder: (context) => EditAddress(
              //billingAddress: data[RouteParamConstants.billingAddress],
              address: data["address"], // route with address
            )
        );
      case RouteConstants.addNewBillingAddress:
        return MaterialPageRoute(builder: (context) => AddNewBillingAddress());
      case RouteConstants.addNewShippingAddress:
        return MaterialPageRoute(builder: (context) => AddNewShippingAddress());
      case RouteConstants.addNewDefaultBillingAddress:
        return MaterialPageRoute(builder: (context) => AddNewDefaultBillingAddress());
      case RouteConstants.addNewDefaultShippingAddress:
        return MaterialPageRoute(builder: (context) => AddNewDefaultShippingAddress());
      case RouteConstants.changeAddress:
        return MaterialPageRoute(builder: (context) => ChangeAddress());
      case RouteConstants.accountDetails:
        return MaterialPageRoute(
              builder: (context) => const AccountDetails(activeTab: 0) // route with active tab param
          );
        //return MaterialPageRoute(builder: (context) => AccountDetails());
      case RouteConstants.settings:
        return MaterialPageRoute(builder: (context) => Settings());
      case RouteConstants.forgotPassword:
        return MaterialPageRoute(builder: (context) => ForgotPassword());
      case RouteConstants.newPassword:
        return MaterialPageRoute(builder: (context) => NewPassword());
      case RouteConstants.resetPassword:
        return MaterialPageRoute(builder: (context) => ResetPassword());
      case RouteConstants.productDetails:
        return MaterialPageRoute(
            builder: (context) => const ProductDetails(id: 0));
      case RouteConstants.cartDetails:
        return MaterialPageRoute(builder: (context) => CartDetailsPage());
      case RouteConstants.myBillingAddress:
        return MaterialPageRoute(builder: (context) => MyBillingAddress());
      case RouteConstants.myShippingAddress:
        return MaterialPageRoute(builder: (context) => MyShippingAddress());
      case RouteConstants.quotes:
        return MaterialPageRoute(builder: (context) => ResponseQuotePage());
      case RouteConstants.quotesDetails:
        return MaterialPageRoute(builder: (context) => QuoteDetailsPage());
      case RouteConstants.billingAddress:
        return MaterialPageRoute(
            builder: (context) => BillingAndShippingAddress());
      case RouteConstants.checkOut:
        return MaterialPageRoute(builder: (context) => CheckOutPage());
      case RouteConstants.admin:
        return MaterialPageRoute(builder: (context) => AdminQuoteResponse());
      case RouteConstants.accountVerificationPage:
        final dynamic? data = settings.arguments;
        print(data);
        return MaterialPageRoute(
            builder: (context) => AccountVerificationPage(
                  mobileNumber: data != null
                      ? data[RouteParamConstants.mobileNumber]
                      : "",
                ));
    }
  }
}

RouteFactory get onGenerateRoute => Routes().route;
