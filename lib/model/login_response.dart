class LoginResponseData {
  int? code;
  String? message;
  Data? data;

  LoginResponseData({this.code, this.message, required this.data});

  LoginResponseData.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = Data.fromJson(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    data['data'] = this.data?.toJson();
    return data;
  }
}

class Data {
  late String authenticationToken;

  Data.fromJson(Map<String, dynamic> json) {
    authenticationToken = json['authentication_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authentication_token'] = authenticationToken;
    return data;
  }
}
