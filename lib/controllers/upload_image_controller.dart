import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:dee_pee_ink/repositories/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '../model/profile_response.dart';
import '../utils/app_preferences.dart';
import '../web_service/api_client.dart';
import '../web_service/api_constants.dart';

class ProfileController extends ChangeNotifier {
  var isLoading = false;
  var imageURL = '';

  late BuildContext _context;
  final ProfileRepository _profileRepository = ProfileRepository();
  final ProfileImageRepository _profileImageRepository = ProfileImageRepository();

  ProfileDetail? _profileDetail;
  ProfileDetail? get profileDetail => _profileDetail;

  Data? _uploadImage;
  Data? get data => _uploadImage;

  void init(BuildContext context) async {
    _context = context;
    _profileDetail = await _profileRepository.getProfileResponse(context);
    _uploadImage = (await _profileImageRepository.getImageProfileResponse(context));
    notifyListeners();
  }

  Future<bool?> upload(File imageFile) async {
    // open a bytestream
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri =
        Uri.parse("http://dpinks.agiratech.com/api/user_profiles/upload_image");

    // create multipart request
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(await addAuthenticationHeader());

    // multipart that takes file
    var multipartFile = http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path),
        contentType: new MediaType('image', 'jpeg'));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields.addAll({"title": "profile"});

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  Future<Map<String, String>> addAuthenticationHeader() async {
    return {
      WebserviceConstants.token: await AppPreferences.getAuthenticationToken(),
      WebserviceConstants.phone: await AppPreferences.getMobileNumber(),
      WebserviceConstants.contentType: WebserviceConstants.applicationJson
    };
  }
}
