class AddressResponse {
  final int? code;
  final Data? data;

  AddressResponse({
    this.code,
    this.data,
  });

  AddressResponse.fromJson(Map<String, dynamic> json)
    : code = json['code'] as int?,
      data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data?.toJson()
  };
}

class Data {
  final List<Shipping>? shipping;
  final List<Billing>? billing;

  Data({
    this.shipping,
    this.billing,
  });

  Data.fromJson(Map<String, dynamic> json)
    : shipping = (json['Shipping'] as List?)?.map((dynamic e) => Shipping.fromJson(e as Map<String,dynamic>)).toList(),
      billing = (json['Billing'] as List?)?.map((dynamic e) => Billing.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'Shipping' : shipping?.map((e) => e.toJson()).toList(),
    'Billing' : billing?.map((e) => e.toJson()).toList()
  };
}

class Shipping {
  final Address? address;

  Shipping({
    this.address,
  });

  Shipping.fromJson(Map<String, dynamic> json)
    : address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'address' : address?.toJson()
  };
}

class Address {
  final int? id;
  final String? addressLine1;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? region;
  final String? alternateContactNumber;
  final String? addressType;
  final String? gstNumber;
  final bool? isDefault;

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

  Address.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      addressLine1 = json['address_line1'] as String?,
      city = json['city'] as String?,
      state = json['state'] as String?,
      postalCode = json['postal_code'] as String?,
      region = json['region'] as String?,
      alternateContactNumber = json['alternate_contact_number'] as String?,
      addressType = json['address_type'] as String?,
      gstNumber = json['gst_number'] as String?,
      isDefault = json['is_default'] as bool?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'address_line1' : addressLine1,
    'city' : city,
    'state' : state,
    'postal_code' : postalCode,
    'region' : region,
    'alternate_contact_number' : alternateContactNumber,
    'address_type' : addressType,
    'gst_number' : gstNumber,
    'is_default' : isDefault
  };
}

class Billing {
  final Address? address;

  Billing({
    this.address,
  });

  Billing.fromJson(Map<String, dynamic> json)
    : address = (json['address'] as Map<String,dynamic>?) != null ? Address.fromJson(json['address'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'address' : address?.toJson()
  };
}

class Address1 {
  final int? id;
  final String? addressLine1;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? region;
  final String? alternateContactNumber;
  final String? addressType;
  final String? gstNumber;
  final bool? isDefault;

  Address1({
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

  Address1.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      addressLine1 = json['address_line1'] as String?,
      city = json['city'] as String?,
      state = json['state'] as String?,
      postalCode = json['postal_code'] as String?,
      region = json['region'] as String?,
      alternateContactNumber = json['alternate_contact_number'] as String?,
      addressType = json['address_type'] as String?,
      gstNumber = json['gst_number'] as String?,
      isDefault = json['is_default'] as bool?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'address_line1' : addressLine1,
    'city' : city,
    'state' : state,
    'postal_code' : postalCode,
    'region' : region,
    'alternate_contact_number' : alternateContactNumber,
    'address_type' : addressType,
    'gst_number' : gstNumber,
    'is_default' : isDefault
  };
}