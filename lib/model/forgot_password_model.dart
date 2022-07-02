class ForgotPasswordModel {
  User? user;

  ForgotPasswordModel({this.user});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? mobileNumber;

  User({this.mobileNumber});

  User.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_number'] = mobileNumber;
    return data;
  }
}
