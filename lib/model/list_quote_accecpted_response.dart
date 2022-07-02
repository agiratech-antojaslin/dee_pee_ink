class ListQuoteAcceptedResponse {
  final int? code;
  final Data? data;

  ListQuoteAcceptedResponse({
    this.code,
    this.data,
  });

  ListQuoteAcceptedResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'code': code, 'data': data?.toJson()};
}

class Data {
  final List<QuotesAccepted>? quotes;
  final int? totalCount;

  Data({
    this.quotes,
    this.totalCount,
  });

  Data.fromJson(Map<String, dynamic> json)
      : quotes = (json['quotes'] as List?)
            ?.map((dynamic e) =>
                QuotesAccepted.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalCount = json['total_count'] as int?;

  Map<String, dynamic> toJson() => {
        'quotes': quotes?.map((e) => e.toJson()).toList(),
        'total_count': totalCount
      };
}

class QuotesAccepted {
  final int? id;
  final String? respondedDate;
  final String? expiryDate;
  final String? requestedDate;
  final String? code;
  final double? totalAmount;
  final String? createdAt;
  final double? totalApproxAmount;
  final double? subTotal;
  final double? cgstAmount;
  final double? sgstAmount;
  final QuoteStatus? quoteStatus;
  final Order? order;
  final List<QuoteItems>? quoteItems;

  QuotesAccepted({
    this.id,
    this.respondedDate,
    this.expiryDate,
    this.requestedDate,
    this.code,
    this.totalAmount,
    this.createdAt,
    this.totalApproxAmount,
    this.subTotal,
    this.cgstAmount,
    this.sgstAmount,
    this.quoteStatus,
    this.order,
    this.quoteItems,
  });

  QuotesAccepted.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        respondedDate = json['responded_date'] as String?,
        expiryDate = json['expiry_date'] as String?,
        requestedDate = json['requested_date'] as String?,
        code = json['code'] as String?,
        totalAmount = json['total_amount'] as double?,
        createdAt = json['created_at'] as String?,
        totalApproxAmount = json['total_approx_amount'],
        subTotal = json['sub_total'],
        cgstAmount = json['cgst_amount'],
        sgstAmount = json['sgst_amount'],
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
        'id': id,
        'responded_date': respondedDate,
        'expiry_date': expiryDate,
        'requested_date': requestedDate,
        'code': code,
        'total_amount': totalAmount,
        'created_at': createdAt,
        'total_approx_amount': totalApproxAmount,
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
  final String? code;
  final int? id;
  final String? orderStatus;
  final dynamic billingAddress;
  final dynamic shippingAddress;
  final dynamic deliveryNotes;
  final dynamic deliveredOn;
  final double? totalAmount;
  final double? amountReceived;
  final dynamic paymentMethod;

  Order({
    this.id,
    this.orderStatus,
    this.billingAddress,
    this.shippingAddress,
    this.deliveryNotes,
    this.deliveredOn,
    this.totalAmount,
    this.amountReceived,
    this.paymentMethod,
    this.code,
  });

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        orderStatus = json['order_status'] as String?,
        billingAddress = json['billing_address'],
        shippingAddress = json['shipping_address'],
        deliveryNotes = json['delivery_notes'],
        deliveredOn = json['delivered_on'],
        totalAmount = json['total_amount'],
        amountReceived = json['amount_received'],
        paymentMethod = json['payment_method'],
        code = json['code'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'order_status': orderStatus,
        'billing_address': billingAddress,
        'shipping_address': shippingAddress,
        'delivery_notes': deliveryNotes,
        'delivered_on': deliveredOn,
        'total_amount': totalAmount,
        'amount_received': amountReceived,
        'payment_method': paymentMethod,
        'code': code
      };
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
        offerPrice = json['offer_price'] as double?,
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
