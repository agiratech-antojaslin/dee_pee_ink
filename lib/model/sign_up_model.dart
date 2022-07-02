class SignUpModel {
  SignUpUser? user;

  SignUpModel({this.user});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? SignUpUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class SignUpUser {
  String? fullName;
  String? mobileNumber;
  String? email;
  String? password;

  SignUpUser({this.fullName, this.mobileNumber, this.email, this.password});

  SignUpUser.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_name'] = fullName;
    data['mobile_number'] = mobileNumber;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
