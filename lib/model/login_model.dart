class LoginModel {
  User? user;

  LoginModel({this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? password;

  User({this.mobileNumber, this.password});

  User.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_number'] = this.mobileNumber;
    data['password'] = this.password;
    return data;
  }
}
