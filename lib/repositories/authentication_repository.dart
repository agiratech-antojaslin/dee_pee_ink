import 'dart:convert';

import 'package:dee_pee_ink/model/forgot_password_model.dart';
import 'package:dee_pee_ink/model/forgot_password_response.dart';
import 'package:dee_pee_ink/model/new_password_model.dart';
import 'package:dee_pee_ink/model/new_password_response.dart';
import 'package:dee_pee_ink/model/update_password_model.dart';
import 'package:dee_pee_ink/model/update_password_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../common_widgets/app_snack_bar.dart';
import '../model/login_model.dart';
import '../model/login_response.dart';
import '../model/sign_up_model.dart';
import '../model/signup_response.dart';
import '../utils/api_config.dart';
import '../utils/app_constants.dart';
import '../web_service/api_client.dart';
import '../web_service/api_constants.dart';

class AuthenticationRepository {
  WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<LoginResponseData?> postSignInRequest(
      context, LoginModel loginModel) async {
    String loginUrl = (ApiConfig.dpInksUrl + ApiConstants.dpLogin);
    String json = jsonEncode(loginModel.toJson());

    print(loginUrl);
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    var result =
        await http.post(Uri.parse(loginUrl), headers: headers, body: json);
    Map<String, dynamic> jsonData;
    // var jsonData;

    print(result.body);
    // jsonData = result.body;
    jsonData = jsonDecode(result.body);
    print(jsonData);
    // ignore: unnecessary_null_comparison
    if (jsonData == null) {
      jsonData = {};
    }
    LoginResponseData responseData = LoginResponseData.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context);
      return responseData;
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<SignUpResponse?> postSignUpRequest(
    context,
    String fullName,
    String email,
    String password,
    String mobile,
  ) async {
    SignUpModel model = SignUpModel(
        user: SignUpUser(
            fullName: fullName,
            mobileNumber: mobile,
            email: email,
            password: password));
    String finalUrl = (ApiConfig.baseUrl + ApiConstants.dpSignUp);
    String json = jsonEncode(model.toJson());
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    print(finalUrl);
    print(json);
    var result =
        await http.post(Uri.parse(finalUrl), body: json, headers: headers);
    print(result.statusCode);
    print(result.body);
    Map<String, dynamic> jsonData = jsonDecode(result.body);

    SignUpResponse responseData = SignUpResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE1001) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context);
      return responseData;
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<ForgotPasswordResponse?> postForgotPasswordRequest(
      context, ForgotPasswordModel forgotPasswordModel) async {
    String forgotPasswordUrl =
        (ApiConfig.dpInksUrl + ApiConstants.forgotPassword);
    String json = jsonEncode(forgotPasswordModel.toJson());

    print(forgotPasswordUrl);
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    var result = await http.post(Uri.parse(forgotPasswordUrl),
        headers: headers, body: json);
    Map<String, dynamic> jsonData;
    // var jsonData;

    print(result.body);
    // jsonData = result.body;
    jsonData = jsonDecode(result.body);
    print(jsonData);
    // ignore: unnecessary_null_comparison
    if (jsonData == null) {
      jsonData = {};
    }
    ForgotPasswordResponse responseData =
        ForgotPasswordResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE1004) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context);
      return responseData;
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context);
    }

    return null;
  }

  Future<ResetPasswordResponse?> postResetPasswordRequest(
      context, ResetPasswordModel resetPasswordModel) async {
    String newPasswordUrl = (ApiConfig.dpInksUrl + ApiConstants.resetPassword);
    String json = jsonEncode(resetPasswordModel.toJson());

    print(newPasswordUrl);
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    var result = await http.post(Uri.parse(newPasswordUrl),
        headers: headers, body: json);
    Map<String, dynamic> jsonData;
    // var jsonData;

    print(result.body);
    // jsonData = result.body;
    jsonData = jsonDecode(result.body);
    print(jsonData);
    // ignore: unnecessary_null_comparison
    if (jsonData == null) {
      jsonData = {};
    }
    ResetPasswordResponse responseData =
        ResetPasswordResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE1005) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context);
      return responseData;
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context);
    }
    return null;
  }

  Future<bool> resendOtp(BuildContext? context, model) async {
    String finalUrl = (ApiConfig.baseUrl + ApiConstants.resendOtp);
    String json = jsonEncode(model.toJson());
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    print(finalUrl);
    print(json);
    var result =
        await http.post(Uri.parse(finalUrl), body: json, headers: headers);
    print(result.statusCode);
    print(result.body);
    Map<String, dynamic> jsonData = jsonDecode(result.body);

    SignUpResponse responseData = SignUpResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE ||
        responseData.code == 1003) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context!);
    } else {
      AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context!);
    }

    return true;
  }

  Future<bool> submitAccountVerification(BuildContext? context, model) async {
    String finalUrl = (ApiConfig.baseUrl + ApiConstants.verifyOtp);
    String json = jsonEncode(model.toJson());
    Map<String, String> headers = {
      WebserviceConstants.contentType: WebserviceConstants.applicationJson,
      WebserviceConstants.accept: WebserviceConstants.applicationJson
    };

    print(finalUrl);
    print(json);
    var result =
        await http.post(Uri.parse(finalUrl), body: json, headers: headers);
    print(result.statusCode);
    print(result.body);
    Map<String, dynamic> jsonData = jsonDecode(result.body);

    SignUpResponse responseData = SignUpResponse.fromJson(jsonData);
    if (responseData.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE ||
        responseData.code == 1002) {
      await AppSnackBar(message: responseData.message, color: Colors.green)
          .showAppSnackBar(context!);
      return true;
    } else {
      await AppSnackBar(message: responseData.message, color: Colors.redAccent)
          .showAppSnackBar(context!);
    }

    return false;
  }

  Future<UpdatePasswordResponse?> patchUpdatePassword(context, dynamic model) async {
    String? json;
    if (model != null) {
      json = jsonEncode(model.toJson());
    }
    print("updatePassword " + json!);
    String finalUrl = ApiConfig.baseUrl + ApiConstants.updatePassword;
    print("updatePassword " + finalUrl);
    Map<String, dynamic> jsonData =
    await _webserviceHelper.patch(finalUrl, body: json);
    UpdatePasswordResponse response = UpdatePasswordResponse.fromJson(jsonData);
    print(response.toString());
    print(jsonData.toString());
    if (response.code == WebserviceHelper.WEB_SUCCESS_STATUS_CODE1010) {
      await AppSnackBar(message: response.message, color: Colors.green)
          .showAppSnackBar(context);
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
