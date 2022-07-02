class ProfileResponse {
  int? code;
  ProfileDetail? data;

  ProfileResponse({this.code, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new ProfileDetail.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileDetail {
  int? id;
  String? fullName;
  String? mobileNumber;
  String? email;
  List<Null>? shippingAddresses;
  List<Null>? billingAddresses;

  ProfileDetail(
      {this.id,
        this.fullName,
        this.mobileNumber,
        this.email,
        this.shippingAddresses,
        this.billingAddresses});

  ProfileDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    mobileNumber = json['mobile_number'];
    email = json['email'];
    if (json['shipping_addresses'] != null) {
      shippingAddresses = <Null>[];
      json['shipping_addresses'].forEach((v) {
      //  shippingAddresses!.add(new Null.fromJson(v));
      });
    }
    if (json['billing_addresses'] != null) {
      billingAddresses = <Null>[];
      json['billing_addresses'].forEach((v) {
      //  billingAddresses!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['mobile_number'] = this.mobileNumber;
    data['email'] = this.email;
    if (this.shippingAddresses != null) {
    //  data['shipping_addresses'] =
          //this.shippingAddresses!.map((v) => v.toJson()).toList();
    }
    if (this.billingAddresses != null) {
     // data['billing_addresses'] =
         // this.billingAddresses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileImageResponse {
  int? code;
  String? message;
  Data? data;

  ProfileImageResponse({this.code, this.message, this.data});

  ProfileImageResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    picture =
    json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    pictureUrl = json['picture_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    data['picture_url'] = this.pictureUrl;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order'] = this.order;
    data['title'] = this.title;
    return data;
  }
}
