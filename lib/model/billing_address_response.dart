class BillingAddressResponse {
  int? code;
  String? message;
  Data? data;

  BillingAddressResponse({this.code, this.message, this.data});

  BillingAddressResponse.fromJson(Map<String, dynamic> json) {
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
  Address? address;
  ShippingAddressDetails? shippingAddressDetails;

  Data({this.user, this.address, this.shippingAddressDetails});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    shippingAddressDetails = json['shipping_address_details'] != null
        ? new ShippingAddressDetails.fromJson(json['shipping_address_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.shippingAddressDetails != null) {
      data['shipping_address_details'] = this.shippingAddressDetails!.toJson();
    }
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

  Address(
      {this.id,
        this.addressLine1,
        this.city,
        this.state,
        this.postalCode,
        this.region,
        this.alternateContactNumber,
        this.addressType,
        this.gstNumber,
        this.isDefault});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressLine1 = json['address_line1'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    region = json['region'];
    alternateContactNumber = json['alternate_contact_number'];
    addressType = json['address_type'];
    gstNumber = json['gst_number'];
    isDefault = json['is_default'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_line1'] = this.addressLine1;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['region'] = this.region;
    data['alternate_contact_number'] = this.alternateContactNumber;
    data['address_type'] = this.addressType;
    data['gst_number'] = this.gstNumber;
    data['is_default'] = this.isDefault;
    return data;
  }
}

class ShippingAddressDetails {
  Address? address;

  ShippingAddressDetails({this.address});

  ShippingAddressDetails.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    return data;
  }
}
