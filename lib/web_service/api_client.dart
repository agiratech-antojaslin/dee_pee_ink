import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/app_configuration.dart';
import '../utils/app_preferences.dart';
import 'api_constants.dart';
import 'network_check.dart';

typedef JSONResponseParser = dynamic Function(Map<String, dynamic> json);

class WebserviceHelper {
  // next three lines makes this class a Singleton
  static final WebserviceHelper _instance = WebserviceHelper.internal();

  static const int WEB_SUCCESS_STATUS_CODE = 3001;
  static const int resendOTPSuccess = 1003;
  static const int WEB_SUCCESS_STATUS_CODE1004 = 1004;
  static const int WEB_SUCCESS_STATUS_CODE1005 = 1005;
  static const int WEB_SUCCESS_STATUS_CODE1001 = 1001;
  static const int WEB_SUCCESS_STATUS_CODE1010 = 1010;
  static const int WEB_SUCCESS_STATUS_CODE204 = 204;
  static const int ERROR_STATUS_CODE3501 = 3501;
  static const int ERROR_SIGN_UP1502 = 1502;
  static const int API_SUCCESS = 200;
  static const int createAddressSuccess = 1008;
  static const int updatePasswordSuccessCode = 1010;
  static const int viewAddressSuccess = 1014;
  static const int successErrorProductDetailStatusCode = 2003;
  static const int featureProductSuccessCode = 2004;
  static const int errorProductDetailStatusCode = 2502;
  static const int successAddQuoteStatusCode = 6002;
  static const int errorAddQuoteStatusCode = 5004;
  static const int errorAddQuoteNoRecordStatusCode = 5003;
  static const int SUCCESS_STATUS_CODE = 200;
  static const int successViewCartStatusCode = 6006;
  static const int errorViewCartStatusCode = 5003;
  static const int successRequestQuoteStatusCode = 6004;
  static const int successDeleteCartStatusCode = 7001;
  static const int successDeleteCartNoRecordStatusCode = 7002;
  static const int errorDeleteCartStatusCode = 7006;
  static const int successEditCartStatusCode = 6008;
  static const int tokenExpiredStatusCode = 5008;
  static const int successListQuoteStatusCode = 6001;
  static const int successAcceptQuoteStatusCode = 6007;
  static const int successDenyQuoteStatusCode = 6003;
  static const int successDeleteCartNewStatusCode = 6011;
  static const int successDownloadPDF = 6012;
  static const int successDeleteCartNoRecordNewStatusCode = 5003;
  static const int errorDeleteCartNewStatusCode = 7006;
  static const int successOrderConfirmStatusCode = 8001;
  static const int successOfflinePaymentStatusCode = 8002;
  static const int successUpdateAddress = 1009;
  static const int successDeleteAddressStatusCode = 1015;

  WebserviceHelper.internal();

  factory WebserviceHelper() => _instance;

  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    required final dynamic Function(bool) onError,
  }) async {
    final bool isNetworkAvailable = await NetworkCheck().check();
    if (isNetworkAvailable) {
      if (AppConfiguration().isUserLoggedIn) {
        headers = await addAuthenticationHeader();
      }

      final http.Response response =
          await http.get(Uri.parse(url), headers: headers);

      if (response != null) {
        Map<String, dynamic> jsonData = {};
        try {
          jsonData = jsonDecode(response.body) ?? {};
        } catch (e) {
          print(e.toString());
        }
        print("GetRESPONSE" + response.body);
        jsonData.putIfAbsent(
            WebserviceConstants.statusCode, () => response.statusCode);
        return jsonData;
      }
    }

    return onError != null ? onError(isNetworkAvailable) : null;
  }

  /// DELETE API call
  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    body,
  }) async {
    if (AppConfiguration().isUserLoggedIn) {
      headers = await addAuthenticationHeader();
    }

    final http.Response response = await http.delete(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    if (response != null) {
      Map<String, dynamic> jsonData = {};
      try {
        jsonData = jsonDecode(response.body);
      } catch (e) {
        print(e.toString());
      }
      print("GetRESPONSE" + response.body);
      jsonData.putIfAbsent(
          WebserviceConstants.statusCode, () => response.statusCode);
      return jsonData;
    }

    return null!;
  }

  // POST Api call
  Future<dynamic> post(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    body,
  }) async {
    if (AppConfiguration().isUserLoggedIn) {
      headers ??= await addAuthenticationHeader();
    }
    String json = jsonEncode(body);

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json,
    );
    Map<String, dynamic> jsonData = {};
    try {
      jsonData = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    if (jsonData == null) {
      jsonData = {};
    }
    jsonData.putIfAbsent(
        WebserviceConstants.statusCode, () => response.statusCode);
    print("POstRESPONSE" + response.body);
    return jsonData;
  }

  Future<dynamic> postAPI(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    body,
  }) async {
    if (AppConfiguration().isUserLoggedIn) {
      headers ??= await addAuthenticationHeader();
    }
    // String json = jsonEncode(body);
print("post body"+body);
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    Map<String, dynamic> jsonData = {};
    try {
      jsonData = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    if (jsonData == null) {
      jsonData = {};
    }
    jsonData.putIfAbsent(
        WebserviceConstants.statusCode, () => response.statusCode);
    print("POstRESPONSE" + response.body);
    return jsonData;
  }

  //PUT Api call
  Future<dynamic> put(
    String url, {
    required Map<String, String> headers,
    required Map<String, String> params,
    body,
  }) async {
    headers = await addAuthenticationHeader();
    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    Map<String, dynamic> jsonData = {};
    try {
      jsonData = jsonDecode(response.body);
    } catch (_) {}
    if (jsonData == null) {
      jsonData = {};
    }
    jsonData.putIfAbsent(
        WebserviceConstants.statusCode, () => response.statusCode);
    print("PutRESPONSE" + response.body);
    return jsonData;
  }

  Future<dynamic> patch(
    String url, {
    Map<String, String>? headers,
    Map<String, String>? params,
    body,
  }) async {
    if (AppConfiguration().isUserLoggedIn) {
      headers ??= await addAuthenticationHeader();
    }
    final response = await http.patch(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    Map<String, dynamic> jsonData = {};
    try {
      jsonData = jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
    }
    if (jsonData == null) {
      jsonData = {};
    }
    jsonData.putIfAbsent(
        WebserviceConstants.statusCode, () => response.statusCode);
    print("patchRESPONSE" + response.body);
    return jsonData;
  }

  Future<Map<String, String>> addAuthenticationHeader() async {
    return {
      WebserviceConstants.token: await AppPreferences.getAuthenticationToken(),
      WebserviceConstants.phone: await AppPreferences.getMobileNumber(),
      WebserviceConstants.contentType: WebserviceConstants.applicationJson
    };
  }
}
