class AddressDeleteBody {
  final int? addressId;

  AddressDeleteBody({
    this.addressId,
  });

  AddressDeleteBody.fromJson(Map<String, dynamic> json)
    : addressId = json['address_id'] as int?;

  Map<String, dynamic> toJson() => {
    'address_id' : addressId
  };
}