class ResetPasswordModel {
  User? user;

  ResetPasswordModel({this.user});

  ResetPasswordModel.fromJson(Map<String, dynamic> json) {
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
  String? forgotOtp;
  String? password;
  String? passwordConfirmation;

  User(
      {this.mobileNumber,
      this.forgotOtp,
      this.password,
      this.passwordConfirmation});

  User.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobile_number'];
    forgotOtp = json['forgot_otp'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile_number'] = mobileNumber;
    data['forgot_otp'] = forgotOtp;
    data['password'] = password;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
