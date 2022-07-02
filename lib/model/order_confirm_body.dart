class OrderConfirmBody {
  final int? billingAddressId;
  final int? shippingAddressId;

  OrderConfirmBody({
    this.billingAddressId,
    this.shippingAddressId,
  });

  OrderConfirmBody.fromJson(Map<String, dynamic> json)
    : billingAddressId = json['billing_address_id'] as int?,
      shippingAddressId = json['shipping_address_id'] as int?;

  Map<String, dynamic> toJson() => {
    'billing_address_id' : billingAddressId,
    'shipping_address_id' : shippingAddressId
  };
}