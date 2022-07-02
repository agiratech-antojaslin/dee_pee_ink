import 'dart:convert';

import 'package:dee_pee_ink/common_widgets/app_snack_bar.dart';
import 'package:dee_pee_ink/model/add_quote_response.dart';
import 'package:dee_pee_ink/model/quote_pdf_response.dart';
import 'package:dee_pee_ink/model/request_quote_response.dart.dart';
import 'package:dee_pee_ink/utils/api_config.dart';
import 'package:dee_pee_ink/utils/app_constants.dart';
import 'package:dee_pee_ink/utils/app_preferences.dart';
import 'package:dee_pee_ink/web_service/api_client.dart';
import 'package:flutter/material.dart';

import '../model/accept_create_order_response.dart';
import '../model/error_response.dart';
import '../model/list_quote_accecpted_response.dart';
import '../model/list_quote_response.dart';
import '../model/quote_deny_response.dart';

class QuotesRepository {
  final WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<AddQuoteResponse?> addQuote(context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("AddQuoteRequest " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.addQuoteItems;
    print("AddQuoteurl " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    AddQuoteResponse response = AddQuoteResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successAddQuoteStatusCode) {
      return response;
    } else if (response.code ==
        WebserviceHelper.errorAddQuoteNoRecordStatusCode) {
      AddQuoteErrorResponse response = AddQuoteErrorResponse.fromJson(jsonData);

      await AppPreferences.setCurQuoteId("");
      await AppPreferences.setCartCount("");
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);
    } else {
      AddQuoteErrorResponse response = AddQuoteErrorResponse.fromJson(jsonData);
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<RequestQuoteResponse?> requtestQuote(context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("requtestQuote " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.requestQuote;
    print("requtestQuote " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    RequestQuoteResponse response = RequestQuoteResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successRequestQuoteStatusCode) {
      return response;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<ListQuoteAcceptedResponse?> listQuoteAccepted(
      context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("listQuoteAccepted " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.listQuoteItems;
    print("listQuoteAcceptedurl " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    ListQuoteAcceptedResponse response =
        ListQuoteAcceptedResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successListQuoteStatusCode) {
      return response;
    } else {
      ErrorResponse response = ErrorResponse.fromJson(jsonData);

      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<ListQuoteResponse?> listQuote(context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("listQuoteRequest " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.listQuoteItems;
    print("listQuoteurl " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    ListQuoteResponse response = ListQuoteResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successListQuoteStatusCode) {
      return response;
    } else {
      ErrorResponse response = ErrorResponse.fromJson(jsonData);

      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);

      return null;
    }
  }

  Future<AcceptQuoteCreateOrderResponse?> acceptQuote(
      context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("acceptQuote " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.acceptQuote;
    print("acceptQuote " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    AcceptQuoteCreateOrderResponse response =
        AcceptQuoteCreateOrderResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successAcceptQuoteStatusCode) {
      return response;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<QuoteDenyResponse?> denyQuote(context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("denyQuote " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.denyQuote;
    print("denyQuote " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.postAPI(finalUrl, body: json);
    QuoteDenyResponse response = QuoteDenyResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successDenyQuoteStatusCode) {
      return response;
    } else {
      AppSnackBar(
              message: response.message.toString(),
              color: Theme.of(context).errorColor)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<QuotePDFResponse?> downloadQuote(
      context,quoteItemsId) async {
    String? json;
    //debugPrint("Download Quote ${json!}");
    String finalUrl = ApiConfig.baseUrl + ApiConstants.downloadQuote.replaceAll("\$id", quoteItemsId);
    print("downloadQuote " + finalUrl);
    Map<String, dynamic> jsonData =
    await _webserviceHelper.get(finalUrl, onError: (bool ) {  }, );
    QuotePDFResponse response =
    QuotePDFResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    // return response;
    if (response.code == WebserviceHelper.successDownloadPDF) {
      return response;
    }
    return null;
  }
}
