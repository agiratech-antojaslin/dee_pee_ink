class BillingAndShippingAddressModel {
  Address? address;
  bool? applyToShippingAddress;

  BillingAndShippingAddressModel({this.address, this.applyToShippingAddress});

  BillingAndShippingAddressModel.fromJson(Map<String, dynamic> json) {
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    applyToShippingAddress = json['apply_to_shipping_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['apply_to_shipping_address'] = applyToShippingAddress;
    return data;
  }
}

class Address {
  String? addressLine1;
  String? city;
  String? state;
  String? postalCode;
  String? region;
  String? alternateContactNumber;
  String? addressType;
  String? gstNumber;

  Address(
      {this.addressLine1,
      this.city,
      this.state,
      this.postalCode,
      this.region,
      this.alternateContactNumber,
      this.addressType,
      this.gstNumber});

  Address.fromJson(Map<String, dynamic> json) {
    addressLine1 = json['address_line1'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postal_code'];
    region = json['region'];
    alternateContactNumber = json['alternate_contact_number'];
    addressType = json['address_type'];
    gstNumber = json['gst_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_line1'] = addressLine1;
    data['city'] = city;
    data['state'] = state;
    data['postal_code'] = postalCode;
    data['region'] = region;
    data['alternate_contact_number'] = alternateContactNumber;
    data['address_type'] = addressType;
    data['gst_number'] = gstNumber;
    return data;
  }
}
