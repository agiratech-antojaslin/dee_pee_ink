class CommonOtpModel {
  User? user;

  CommonOtpModel({this.user});

  CommonOtpModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? mobileNumber;
  String? otp;

  User({this.mobileNumber, this.otp});

  User.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    if (otp != null) {
      data['otp'] = this.otp;
    }
    return data;
  }
}
