class ViewCartResponse {
  final int? code;
  final Data? data;

  ViewCartResponse({
    this.code,
    this.data,
  });

  ViewCartResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'code': code, 'data': data?.toJson()};
}

class Data {
  final int? id;
  final dynamic respondedDate;
  final dynamic expiryDate;
  final dynamic requestedDate;
  final String? code;
  final double? totalAmount;
  final double? totaApproxAmount;
  final double? subTotal;
  final double? cgstAmount;
  final double? sgstSmount;
  final QuoteStatus? quoteStatus;
  final List<QuoteItems>? quoteItems;

  Data({
    this.id,
    this.respondedDate,
    this.expiryDate,
    this.requestedDate,
    this.code,
    this.totalAmount,
    this.totaApproxAmount,
    this.subTotal,
    this.cgstAmount,
    this.sgstSmount,
    this.quoteStatus,
    this.quoteItems,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        respondedDate = json['responded_date'],
        expiryDate = json['expiry_date'],
        requestedDate = json['requested_date'],
        code = json['code'] as String?,
        totalAmount = json['total_amount'],
        totaApproxAmount = json['total_approx_amount'],
        subTotal = json['sub_total'],
        cgstAmount = json['cgst_amount'],
        sgstSmount = json['sgst_amount'],
        quoteStatus = (json['quote_status'] as Map<String, dynamic>?) != null
            ? QuoteStatus.fromJson(json['quote_status'] as Map<String, dynamic>)
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
        'total_approx_amount': totaApproxAmount,
        'sub_total': subTotal,
        'cgst_amount': cgstAmount,
        'sgst_amount': sgstSmount,
        'quote_status': quoteStatus?.toJson(),
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

class QuoteItems {
  final int? id;
  final int? quantity;
  final dynamic offerPrice;
  final dynamic offerCgst;
  final dynamic offerSgst;
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
        offerPrice = json['offer_price'],
        offerCgst = json['offer_cgst'],
        offerSgst = json['offer_sgst'],
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
  final double? approxPrice;
  final bool? displayPrice;
  final bool? isActive;
  final dynamic cgst;
  final dynamic sgst;
  final Brand? brand;
  final Unit? unit;
  final List<Pictures>? pictures;

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
    this.pictures,
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        code = json['code'] as String?,
        approxPrice = json['approx_price'] as double?,
        displayPrice = json['display_price'] as bool?,
        isActive = json['is_active'] as bool?,
        cgst = json['cgst'],
        sgst = json['sgst'],
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
            : null,
        unit = (json['unit'] as Map<String, dynamic>?) != null
            ? Unit.fromJson(json['unit'] as Map<String, dynamic>)
            : null,
        pictures = (json['pictures'] as List?)
            ?.map((dynamic e) => Pictures.fromJson(e as Map<String, dynamic>))
            .toList();

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
        'unit': unit?.toJson(),
        'pictures': pictures?.map((e) => e.toJson()).toList()
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

class Pictures {
  final int? id;
  final String? title;
  final dynamic order;
  final String? url;

  Pictures({
    this.id,
    this.title,
    this.order,
    this.url,
  });

  Pictures.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        order = json['order'],
        url = json['url'] as String?;

  Map<String, dynamic> toJson() =>
      {'id': id, 'title': title, 'order': order, 'url': url};
}

class ViewCartErrorResponse {
  final int? code;
  final String? message;

  ViewCartErrorResponse({
    this.code,
    this.message,
  });

  ViewCartErrorResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
