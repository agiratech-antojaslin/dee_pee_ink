import 'dart:convert';

import 'package:dee_pee_ink/model/address_response.dart';
import 'package:dee_pee_ink/model/biling_address_model.dart' as prefix;
import 'package:dee_pee_ink/model/biling_address_model.dart';
import 'package:dee_pee_ink/model/billing_address_response.dart';
import 'package:dee_pee_ink/web_service/api_client.dart';
import 'package:flutter/material.dart';

import '../common_widgets/app_snack_bar.dart';
import '../model/offline_payment_response.dart';
import '../model/order_confirm_response.dart';
import '../model/success_response.dart';
import '../model/update_address_response.dart';
import '../utils/api_config.dart';
import '../utils/app_constants.dart';
import '../web_service/api_constants.dart';

class AddressRepository {
  final WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<BillingAddressResponse?> postCreateAddressRequest(
      context,
      // String address,
      // String city,
      // String state,
      // String pinCode,
      // String country,
      // String addressType,
      // String gstNumber,
      prefix.BillingAddressModel billingAddressModel) async {
    String finalUrl = (ApiConfig.baseUrl + ApiConstants.createAddress);
    String json = jsonEncode(billingAddressModel.toJson());
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    print(finalUrl);
    print(json);
    var result = await _webserviceHelper.postAPI(finalUrl, body: json);
    print(result.statusCode);
    print(result.body);
    Map<String, dynamic> jsonData = jsonDecode(result.body);

    BillingAddressResponse responseData =
        BillingAddressResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.createAddressSuccess) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context);
      return responseData;
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<BillingAddressResponse?> postCreateAddress(
    context,
    String address,
    String city,
    String state,
    String pinCode,
    String country,
    String addressType,
    String gstNumber,
      bool applyToShippingAddress,
  ) async {
    prefix.BillingAddressModel billingAddressModel = BillingAddressModel(
      address: prefix.Address(
          addressLine1: address,
          city: city,
          postalCode: pinCode,
          state: state,
          region: country,
          addressType: addressType,
          gstNumber: gstNumber,
      ),
      applyToShippingAddress: applyToShippingAddress
    );
    String finalUrl = (ApiConfig.baseUrl + ApiConstants.createAddress);
    String json = jsonEncode(billingAddressModel.toJson());
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    print(finalUrl);
    print(json);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);

    BillingAddressResponse responseData =
        BillingAddressResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.createAddressSuccess) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context);
      return responseData;
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<AddressResponse?> listAddress(context) async {
    String finalUrl = ApiConfig.baseUrl + ApiConstants.listAddress;
    print("listAddressUrl " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.get(finalUrl, onError: (bool) {});
    AddressResponse response = AddressResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.viewAddressSuccess) {
      return response;
    }
  }

  Future<OrderConfirmResponse?> orderConfirmation(
      orderId, context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("orderConfirmation " + json!);
    String finalUrl = ApiConfig.baseUrl +
        ApiConstants.orderConfirm.replaceAll("\$id", orderId);
    print("orderConfirmation " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.patch(finalUrl, body: json);
    OrderConfirmResponse response = OrderConfirmResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    if (response.code == WebserviceHelper.successOrderConfirmStatusCode) {
      return response;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<OfflinePaymentResponse?> offlinePayment(
      orderId, context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("offlinePayment " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.paymentUpdate;
    print("offlinePayment " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    OfflinePaymentResponse response = OfflinePaymentResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    if (response.code == WebserviceHelper.successOfflinePaymentStatusCode) {
      return response;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<SuccessResponse?> deleteAddress(
  context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("deleteAddress " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.deleteAddress;
    print("deleteAddress " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.delete(finalUrl, body: json);
    SuccessResponse response = SuccessResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    if (response.code == WebserviceHelper.successDeleteAddressStatusCode) {
      return response;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<UpdateAddressResponse?> updateAddress(
      addressId, context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("updateAddress " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.updateAddress;
    print("updateAddress " + finalUrl);
    Map<String, dynamic> jsonData =
    await _webserviceHelper.patch(finalUrl, body: json);
    UpdateAddressResponse response = UpdateAddressResponse.fromJson(jsonData);
    print("Response: ${response.toString()}");
    print(jsonData.toString());
    if (response.code == WebserviceHelper.successUpdateAddress) {
      return response;
    } else {
      AppSnackBar(
          message: response.message.toString(),
          color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }
}
