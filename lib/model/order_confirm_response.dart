class OrderConfirmResponse {
  final int? code;
  final String? message;
  final Data? data;

  OrderConfirmResponse({
    this.code,
    this.message,
    this.data,
  });

  OrderConfirmResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'code': code, 'message': message, 'data': data?.toJson()};
}

class Data {
  final int? userId;
  final int? id;
  final int? quoteId;
  final double? totalAmount;
  final double? amountReceived;
  final String? code;
  final OrderStatus? orderStatus;

  Data({
    this.userId,
    this.id,
    this.quoteId,
    this.totalAmount,
    this.amountReceived,
    this.code,
    this.orderStatus,
  });

  Data.fromJson(Map<String, dynamic> json)
      : userId = json['user_id'] as int?,
        id = json['id'] as int?,
        quoteId = json['quote_id'] as int?,
        totalAmount = json['total_amount'],
        amountReceived = json['amount_received'],
        code = json['code'] as String?,
        orderStatus = (json['order_status'] as Map<String, dynamic>?) != null
            ? OrderStatus.fromJson(json['order_status'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'id': id,
        'quote_id': quoteId,
        'total_amount': totalAmount,
        'amount_received': amountReceived,
        'code': code,
        'order_status': orderStatus?.toJson()
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
