class UpdatePasswordModel {
  User? user;

  UpdatePasswordModel({
    this.user,
  });

  UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user'] = user?.toJson();
    return json;
  }
}

class User {
  String? currentPassword;
  String? password;

  User({
    this.currentPassword,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    currentPassword = json['current_password'] as String?;
    password = json['password'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['current_password'] = currentPassword;
    json['password'] = password;
    return json;
  }
}