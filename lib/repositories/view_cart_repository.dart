import 'dart:convert';

import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/model/edit_cart_response.dart';
import 'package:dee_pee_ink/model/view_cart_response.dart';
import 'package:dee_pee_ink/utils/api_config.dart';
import 'package:dee_pee_ink/utils/app_constants.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:dee_pee_ink/web_service/api_client.dart';
import 'package:flutter/material.dart';

class ViewCartRepository {
  final WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<ViewCartResponse?> getCartDetails(context, String quoteId) async {
    String finalUrl = ApiConfig.baseUrl +
        ApiConstants.viewQuoteItems.replaceAll("\$id", quoteId);
    print("getCartDetails " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.get(finalUrl, onError: (bool) {});
    ViewCartResponse response = ViewCartResponse.fromJson(jsonData);
    print(response.data?.toString());
    if (response.code == WebserviceHelper.successViewCartStatusCode) {
      return response;
    } else {
      ViewCartErrorResponse response = ViewCartErrorResponse.fromJson(jsonData);
      if (response.code == WebserviceHelper.errorViewCartStatusCode) {
        await AppPreferences.setCurQuoteId("");
        await AppPreferences.setCartCount("");
        AppSnackBar(
                message: response.message.toString(),
                color: Theme.of(context).errorColor)
            .showAppSnackBar(context);
      }

      return null;
    }
  }

  Future<EditCartResponse?> deleteCartItems(
      context, String quoteItemsId) async {
    String finalUrl = ApiConfig.baseUrl +
        ApiConstants.deleteQuoteItems.replaceAll("\$id", quoteItemsId);
    print("deleteCart " + finalUrl);
    Map<String, dynamic> jsonData = await _webserviceHelper.delete(
      finalUrl,
    );
    EditCartResponse response = EditCartResponse.fromJson(jsonData);
    print(response.toString());
    if (response.code == WebserviceHelper.successDeleteCartStatusCode) {
      return response;
    } else if (response.code ==
        WebserviceHelper.successDeleteCartNoRecordStatusCode) {
      return response;
    } else if (response.code == WebserviceHelper.errorDeleteCartStatusCode) {
      await AppPreferences.setCurQuoteId("");
      await AppPreferences.setCartCount("");
      return null;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<EditCartResponse?> deleteCartItemsNew(context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("deleteCartItemsNewBody " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.deleteQuoteItemsNew;
    print("deleteCartItemsNew " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    EditCartResponse response = EditCartResponse.fromJson(jsonData);
    print(response.toString());
    if (response.code == WebserviceHelper.successDeleteCartNewStatusCode) {
      return response;
    } else if (response.code ==
        WebserviceHelper.successDeleteCartNoRecordStatusCode) {
      return response;
    } else if (response.code == WebserviceHelper.errorDeleteCartStatusCode) {
      await AppPreferences.setCurQuoteId("");
      await AppPreferences.setCartCount("");
      return null;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<EditCartResponse?> editCartItems(
      quoteItemsId, context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("EditCartResponse " + json!);
    String finalUrl = ApiConfig.baseUrl +
        ApiConstants.editQuoteItems.replaceAll("\$id", quoteItemsId);
    print("EditCartResponseurl " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.patch(finalUrl, body: json);
    EditCartResponse response = EditCartResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    if (response.code == WebserviceHelper.successEditCartStatusCode) {
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
