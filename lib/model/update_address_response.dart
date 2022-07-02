class UpdateAddressResponse {
  int? code;
  String? message;
  Data? data;

  UpdateAddressResponse({
    this.code,
    this.message,
    this.data,
  });

  UpdateAddressResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int?;
    message = json['message'] as String?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['code'] = code;
    json['message'] = message;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  User? user;
  Address? address;

  Data({
    this.user,
    this.address,
  });

  Data.fromJson(Map<String, dynamic> json) {
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['user'] = user?.toJson();
    json['address'] = address?.toJson();
    return json;
  }
}

class User {
  int? id;
  String? fullName;

  User({
    this.id,
    this.fullName,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    fullName = json['full_name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['full_name'] = fullName;
    return json;
  }
}

class Address {
  int? id;
  String? addressLine1;
  String? city;
  String? state;
  String? postalCode;
  String? region;
  String? alternateContactNumber;
  String? addressType;
  String? gstNumber;
  bool? isDefault;

  Address({
    this.id,
    this.addressLine1,
    this.city,
    this.state,
    this.postalCode,
    this.region,
    this.alternateContactNumber,
    this.addressType,
    this.gstNumber,
    this.isDefault,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    addressLine1 = json['address_line1'] as String?;
    city = json['city'] as String?;
    state = json['state'] as String?;
    postalCode = json['postal_code'] as String?;
    region = json['region'] as String?;
    alternateContactNumber = json['alternate_contact_number'] as String?;
    addressType = json['address_type'] as String?;
    gstNumber = json['gst_number'] as String?;
    isDefault = json['is_default'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['address_line1'] = addressLine1;
    json['city'] = city;
    json['state'] = state;
    json['postal_code'] = postalCode;
    json['region'] = region;
    json['alternate_contact_number'] = alternateContactNumber;
    json['address_type'] = addressType;
    json['gst_number'] = gstNumber;
    json['is_default'] = isDefault;
    return json;
  }
}