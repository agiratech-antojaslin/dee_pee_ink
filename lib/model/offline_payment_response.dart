class OfflinePaymentResponse {
  final int? code;
  final String? message;
  final Data? data;

  OfflinePaymentResponse({
    this.code,
    this.message,
    this.data,
  });

  OfflinePaymentResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'code': code, 'message': message, 'data': data?.toJson()};
}

class Data {
  final int? id;
  final int? quoteId;
  final int? userId;
  final double? totalAmount;
  final double? amountReceived;
  final String? code;
  final OrderStatus? orderStatus;
  final PaymentMethod? paymentMethod;

  Data({
    this.id,
    this.quoteId,
    this.userId,
    this.totalAmount,
    this.amountReceived,
    this.code,
    this.orderStatus,
    this.paymentMethod,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        quoteId = json['quote_id'] as int?,
        userId = json['user_id'] as int?,
        totalAmount = json['total_amount'],
        amountReceived = json['amount_received'],
        code = json['code'] as String?,
        orderStatus = (json['order_status'] as Map<String, dynamic>?) != null
            ? OrderStatus.fromJson(json['order_status'] as Map<String, dynamic>)
            : null,
        paymentMethod =
            (json['payment_method'] as Map<String, dynamic>?) != null
                ? PaymentMethod.fromJson(
                    json['payment_method'] as Map<String, dynamic>)
                : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'quote_id': quoteId,
        'user_id': userId,
        'total_amount': totalAmount,
        'amount_received': amountReceived,
        'code': code,
        'order_status': orderStatus?.toJson(),
        'payment_method': paymentMethod?.toJson()
      };
}

class OrderStatus {
  final int? id;
  final String? name;

  OrderStatus({
    this.id,
    this.name,
  });

  OrderStatus.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class PaymentMethod {
  final int? id;
  final String? mode;

  PaymentMethod({
    this.id,
    this.mode,
  });

  PaymentMethod.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        mode = json['mode'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'mode': mode};
}
