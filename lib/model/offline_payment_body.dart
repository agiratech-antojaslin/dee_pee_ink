class OfflinePaymentBody {
  final int? id;
  final int? paymentMethod;

  OfflinePaymentBody({
    this.id,
    this.paymentMethod,
  });

  OfflinePaymentBody.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      paymentMethod = json['payment_method'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'payment_method' : paymentMethod
  };
}