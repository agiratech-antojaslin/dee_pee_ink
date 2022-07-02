class AddQuoteResponse {
  final int? code;
  final Data? data;

  AddQuoteResponse({
    this.code,
    this.data,
  });

  AddQuoteResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'code': code, 'data': data?.toJson()};
}

class Data {
  final Quote? quote;

  Data({
    this.quote,
  });

  Data.fromJson(Map<String, dynamic> json)
      : quote = (json['quote'] as Map<String, dynamic>?) != null
            ? Quote.fromJson(json['quote'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'quote': quote?.toJson()};
}

class Quote {
  final int? id;
  final int? userId;
  final int? quoteStatusId;
  final dynamic respondedDate;
  final dynamic respondedBy;
  final dynamic expiryDate;
  final dynamic requestedDate;
  final String? code;
  final dynamic totalAmount;
  final String? createdAt;
  final String? updatedAt;
  final dynamic createdByAdminId;
  final QuoteStatus? quoteStatus;
  final List<QuoteItems>? quoteItems;

  Quote({
    this.id,
    this.userId,
    this.quoteStatusId,
    this.respondedDate,
    this.respondedBy,
    this.expiryDate,
    this.requestedDate,
    this.code,
    this.totalAmount,
    this.createdAt,
    this.updatedAt,
    this.createdByAdminId,
    this.quoteStatus,
    this.quoteItems,
  });

  Quote.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        userId = json['user_id'] as int?,
        quoteStatusId = json['quote_status_id'] as int?,
        respondedDate = json['responded_date'],
        respondedBy = json['responded_by'],
        expiryDate = json['expiry_date'],
        requestedDate = json['requested_date'],
        code = json['code'] as String?,
        totalAmount = json['total_amount'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        createdByAdminId = json['created_by_admin_id'],
        quoteStatus = (json['quote_status'] as Map<String, dynamic>?) != null
            ? QuoteStatus.fromJson(json['quote_status'] as Map<String, dynamic>)
            : null,
        quoteItems = (json['quote_items'] as List?)
            ?.map((dynamic e) => QuoteItems.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'quote_status_id': quoteStatusId,
        'responded_date': respondedDate,
        'responded_by': respondedBy,
        'expiry_date': expiryDate,
        'requested_date': requestedDate,
        'code': code,
        'total_amount': totalAmount,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'created_by_admin_id': createdByAdminId,
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
  final int? productId;
  final int? colorId;
  final int? quantity;
  final Product? product;

  QuoteItems({
    this.id,
    this.productId,
    this.colorId,
    this.quantity,
    this.product,
  });

  QuoteItems.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        productId = json['product_id'] as int?,
        colorId = json['color_id'] as int?,
        quantity = json['quantity'] as int?,
        product = (json['product'] as Map<String, dynamic>?) != null
            ? Product.fromJson(json['product'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'color_id': colorId,
        'quantity': quantity,
        'product': product?.toJson()
      };
}

class Product {
  final String? name;
  final String? code;
  final double? approxPrice;
  final bool? displayPrice;
  final bool? isActive;
  final int? brandId;
  final int? unitId;
  final double? cgst;
  final double? sgst;

  Product({
    this.name,
    this.code,
    this.approxPrice,
    this.displayPrice,
    this.isActive,
    this.brandId,
    this.unitId,
    this.cgst,
    this.sgst,
  });

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        code = json['code'] as String?,
        approxPrice = json['approx_price'] as double?,
        displayPrice = json['display_price'] as bool?,
        isActive = json['is_active'] as bool?,
        brandId = json['brand_id'] as int?,
        unitId = json['unit_id'] as int?,
        cgst = json['cgst'] as double?,
        sgst = json['sgst'] as double?;

  Map<String, dynamic> toJson() => {
        'name': name,
        'code': code,
        'approx_price': approxPrice,
        'display_price': displayPrice,
        'is_active': isActive,
        'brand_id': brandId,
        'unit_id': unitId,
        'cgst': cgst,
        'sgst': sgst
      };
}

class AddQuoteErrorResponse {
  final int? code;
  final String? message;

  AddQuoteErrorResponse({
    this.code,
    this.message,
  });

  AddQuoteErrorResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
