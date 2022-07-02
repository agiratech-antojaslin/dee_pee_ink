class QuoteAcceptResponse {
  final int? code;
  final String? message;
  final Data? data;

  QuoteAcceptResponse({
    this.code,
    this.message,
    this.data,
  });

  QuoteAcceptResponse.fromJson(Map<String, dynamic> json)
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
  final String? requestedDate;
  final String? code;
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
    this.quoteStatus,
    this.order,
    this.quoteItems,
  });

  Data.fromJson(Map<String, dynamic> json)
      : totalAmount = json['total_amount'] as double?,
        id = json['id'] as int?,
        respondedDate = json['responded_date'] as String?,
        expiryDate = json['expiry_date'] as String?,
        requestedDate = json['requested_date'] as String?,
        code = json['code'] as String?,
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
        totalAmount = json['total_amount'] as double?,
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
  final int? offerCgst;
  final int? offerSgst;
  final Color? color;
  final Product? product;

  QuoteItems({
    this.id,
    this.quantity,
    this.offerPrice,
    this.offerCgst,
    this.offerSgst,
    this.color,
    this.product,
  });

  QuoteItems.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        quantity = json['quantity'] as int?,
        offerPrice = json['offer_price'] as double?,
        offerCgst = json['offer_cgst'] as int?,
        offerSgst = json['offer_sgst'] as int?,
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
        'offer_cgst': offerCgst,
        'offer_sgst': offerSgst,
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
  final int? approxPrice;
  final bool? displayPrice;
  final bool? isActive;
  final dynamic cgst;
  final dynamic sgst;
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
        approxPrice = json['approx_price'] as int?,
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
