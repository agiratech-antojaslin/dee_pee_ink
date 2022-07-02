import 'package:dee_pee_ink/model/profile_response.dart';
import 'package:dee_pee_ink/web_service/api_client.dart';
import 'package:flutter/material.dart';

import '../common_widgets/app_snack_bar.dart';
import '../utils/api_config.dart';
import '../utils/app_constants.dart';

class ProfileRepository {
  final WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<ProfileDetail?> getProfileResponse(context) async {
    String finalUrl = ApiConfig.baseUrl + ApiConstants.profile ;
    print("Profile " + finalUrl);
    Map<String, dynamic> jsonData =
        await _webserviceHelper.get(finalUrl, onError: (bool) {});
    ProfileResponse response = ProfileResponse.fromJson(jsonData);
    print(response.data?.toString());
    if (response.code == 1006) {
      return response.data;
    }
    return null;
  }
}

class ProfileImageRepository {
  final WebserviceHelper _webserviceHelper = WebserviceHelper();

  Future<Data?> getImageProfileResponse(context) async {
    String finalUrl = ApiConfig.baseUrl + ApiConstants.uploadImage ;
    print("Profile Image" + finalUrl);
    Map<String, dynamic> jsonData =
    await _webserviceHelper.get(finalUrl, onError: (bool) {});
    ProfileImageResponse response = ProfileImageResponse.fromJson(jsonData);
    print(response.data?.toString());
    if (response.code == 1011) {
      return response.data;
    }
    return null;
  }
}