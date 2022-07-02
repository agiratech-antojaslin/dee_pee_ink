class UpdateAddressBody {
  int? id;
  UpdateAddress? address;

  UpdateAddressBody({
    this.id,
    this.address,
  });

  UpdateAddressBody.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    address = (json['address'] as Map<String,dynamic>?) != null ? UpdateAddress.fromJson(json['address'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['address'] = address?.toJson();
    return json;
  }
}

class UpdateAddress {
  String? city;
  int? id;
  String? addressLine1;
  String? state;
  String? postalCode;
  String? region;
  String? alternateContactNumber;
  String? addressType;
  String? gstNumber;

  UpdateAddress({
    this.city,
    this.id,
    this.addressLine1,
    this.state,
    this.postalCode,
    this.region,
    this.alternateContactNumber,
    this.addressType,
    this.gstNumber,
  });

  UpdateAddress.fromJson(Map<String, dynamic> json) {
    city = json['city'] as String?;
    id = json['id'] as int?;
    addressLine1 = json['address_line1'] as String?;
    state = json['state'] as String?;
    postalCode = json['postal_code'] as String?;
    region = json['region'] as String?;
    alternateContactNumber = json['alternate_contact_number'] as String?;
    addressType = json['address_type'] as String?;
    gstNumber = json['gst_number'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['city'] = city;
    json['id'] = id;
    json['address_line1'] = addressLine1;
    json['state'] = state;
    json['postal_code'] = postalCode;
    json['region'] = region;
    json['alternate_contact_number'] = alternateContactNumber;
    json['address_type'] = addressType;
    json['gst_number'] = gstNumber;
    return json;
  }
}