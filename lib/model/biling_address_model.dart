class BillingAddressModel {
  Address? address;
  bool? applyToShippingAddress;

  BillingAddressModel({this.address, this.applyToShippingAddress});

  BillingAddressModel.fromJson(Map<String, dynamic> json) {
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    applyToShippingAddress = json['apply_to_shipping_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['apply_to_shipping_address'] = this.applyToShippingAddress;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_line1'] = this.addressLine1;
    data['city'] = this.city;
    data['state'] = this.state;
    data['postal_code'] = this.postalCode;
    data['region'] = this.region;
    data['alternate_contact_number'] = this.alternateContactNumber;
    data['address_type'] = this.addressType;
    data['gst_number'] = this.gstNumber;
    return data;
  }
}
