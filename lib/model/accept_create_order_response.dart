class AcceptQuoteCreateOrderResponse {
  final int? code;
  final String? message;
  final Data? data;

  AcceptQuoteCreateOrderResponse({
    this.code,
    this.message,
    this.data,
  });

  AcceptQuoteCreateOrderResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() =>
      {'code': code, 'message': message, 'data': data?.toJson()};
}

class Data {
  final double? totalAmount;
  final int? id;
  final String? respondedDate;
  final String? expiryDate;
  final dynamic requestedDate;
  final String? code;
  final double? subTotal;
  final double? cgstAmount;
  final double? sgstAmount;
  final QuoteStatus? quoteStatus;
  final Order? order;
  final List<QuoteItems>? quoteItems;

  Data({
    this.totalAmount,
    this.id,
    this.respondedDate,
    this.expiryDate,
    this.requestedDate,
    this.code,
    this.subTotal,
    this.cgstAmount,
    this.sgstAmount,
    this.quoteStatus,
    this.order,
    this.quoteItems,
  });

  Data.fromJson(Map<String, dynamic> json)
      : totalAmount = json['total_amount'],
        id = json['id'] as int?,
        respondedDate = json['responded_date'] as String?,
        expiryDate = json['expiry_date'] as String?,
        requestedDate = json['requested_date'],
        code = json['code'] as String?,
        subTotal = json['sub_total'] as double?,
        cgstAmount = json['cgst_amount'] as double?,
        sgstAmount = json['sgst_amount'] as double?,
        quoteStatus = (json['quote_status'] as Map<String, dynamic>?) != null
            ? QuoteStatus.fromJson(json['quote_status'] as Map<String, dynamic>)
            : null,
        order = (json['order'] as Map<String, dynamic>?) != null
            ? Order.fromJson(json['order'] as Map<String, dynamic>)
            : null,
        quoteItems = (json['quote_items'] as List?)
            ?.map((dynamic e) => QuoteItems.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'total_amount': totalAmount,
        'id': id,
        'responded_date': respondedDate,
        'expiry_date': expiryDate,
        'requested_date': requestedDate,
        'code': code,
        'sub_total': subTotal,
        'cgst_amount': cgstAmount,
        'sgst_amount': sgstAmount,
        'quote_status': quoteStatus?.toJson(),
        'order': order?.toJson(),
        'quote_items': quoteItems?.map((e) => e.toJson()).toList()
      };
}

class QuoteStatus {
  final int? id;
  final String? name;

  QuoteStatus({
    this.id,
    this.name,
  });

  QuoteStatus.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Order {
  final int? id;
  final double? totalAmount;
  final String? code;
  final OrderStatus? orderStatus;

  Order({
    this.id,
    this.totalAmount,
    this.code,
    this.orderStatus,
  });

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        totalAmount = json['total_amount'],
        code = json['code'] as String?,
        orderStatus = (json['order_status'] as Map<String, dynamic>?) != null
            ? OrderStatus.fromJson(json['order_status'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'total_amount': totalAmount,
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

class QuoteItems {
  final int? id;
  final int? quantity;
  final double? offerPrice;
  final double? individualTotalAmount;
  final Color? color;
  final Product? product;

  QuoteItems({
    this.id,
    this.quantity,
    this.offerPrice,
    this.individualTotalAmount,
    this.color,
    this.product,
  });

  QuoteItems.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        quantity = json['quantity'] as int?,
        offerPrice = json['offer_price'],
        individualTotalAmount = json['individual_total_amount'] as double?,
        color = (json['color'] as Map<String, dynamic>?) != null
            ? Color.fromJson(json['color'] as Map<String, dynamic>)
            : null,
        product = (json['product'] as Map<String, dynamic>?) != null
            ? Product.fromJson(json['product'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'offer_price': offerPrice,
        'individual_total_amount': individualTotalAmount,
        'color': color?.toJson(),
        'product': product?.toJson()
      };
}

class Color {
  final int? id;
  final String? name;
  final bool? isActive;

  Color({
    this.id,
    this.name,
    this.isActive,
  });

  Color.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        isActive = json['is_active'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'is_active': isActive};
}

class Product {
  final int? id;
  final String? name;
  final String? code;
  final double? approxPrice;
  final bool? displayPrice;
  final bool? isActive;
  final double? cgst;
  final double? sgst;
  final Brand? brand;
  final Unit? unit;

  Product({
    this.id,
    this.name,
    this.code,
    this.approxPrice,
    this.displayPrice,
    this.isActive,
    this.cgst,
    this.sgst,
    this.brand,
    this.unit,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        code = json['code'] as String?,
        approxPrice = json['approx_price'],
        displayPrice = json['display_price'] as bool?,
        isActive = json['is_active'] as bool?,
        cgst = json['cgst'],
        sgst = json['sgst'],
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
            : null,
        unit = (json['unit'] as Map<String, dynamic>?) != null
            ? Unit.fromJson(json['unit'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'approx_price': approxPrice,
        'display_price': displayPrice,
        'is_active': isActive,
        'cgst': cgst,
        'sgst': sgst,
        'brand': brand?.toJson(),
        'unit': unit?.toJson()
      };
}

class Brand {
  final int? id;
  final String? name;
  final bool? isActive;

  Brand({
    this.id,
    this.name,
    this.isActive,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        isActive = json['is_active'] as bool?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'is_active': isActive};
}

class Unit {
  final int? id;
  final String? name;
  final bool? isActive;
  final int? volume;

  Unit({
    this.id,
    this.name,
    this.isActive,
    this.volume,
  });

  Unit.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        isActive = json['is_active'] as bool?,
        volume = json['volume'] as int?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'is_active': isActive, 'volume': volume};
}
