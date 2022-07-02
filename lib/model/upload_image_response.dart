class UploadImageResponse {
  int? code;
  String? message;
  Data? data;

  UploadImageResponse({this.code, this.message, this.data});

  UploadImageResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  Picture? picture;
  Null? pictureUrl;

  Data({this.user, this.picture, this.pictureUrl});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    pictureUrl = json['picture_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    data['picture_url'] = pictureUrl;
    return data;
  }
}

class User {
  int? id;
  String? fullName;

  User({this.id, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    return data;
  }
}

class Picture {
  Null? id;
  Null? order;
  String? title;

  Picture({this.id, this.order, this.title});

  Picture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    order = json['order'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order'] = order;
    data['title'] = title;
    return data;
  }
}
