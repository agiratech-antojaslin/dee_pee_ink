class ProductDetailResponse {
  int? code;
  Data? data;

  ProductDetailResponse({
    this.code,
    this.data,
  });

  ProductDetailResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = (json['data'] as Map<String, dynamic>?) != null
            ? Data.fromJson(json['data'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'code': code, 'data': data?.toJson()};
}

class Data {
  final int? id;
  final String? name;
  final String? code;
  final String? highlight;
  final String? description;
  final double? approxPrice;
  final bool? displayPrice;
  final bool? isActive;
  final int? brandId;
  final int? unitId;
  final dynamic cgst;
  final dynamic sgst;
  final String? createdAt;
  final String? updatedAt;
  final bool? isFeatured;
  final Unit? unit;
  final Brand? brand;
  final List<AUIColors>? colors;
  final List<Categories>? categories;
  final List<Pictures>? pictures;

  Data({
    this.id,
    this.name,
    this.code,
    this.highlight,
    this.description,
    this.approxPrice,
    this.displayPrice,
    this.isActive,
    this.brandId,
    this.unitId,
    this.cgst,
    this.sgst,
    this.createdAt,
    this.updatedAt,
    this.isFeatured,
    this.unit,
    this.brand,
    this.colors,
    this.categories,
    this.pictures,
  });

  Data.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?,
        code = json['code'] as String?,
        highlight = json['highlight'] as String?,
        description = json['description'] as String?,
        approxPrice = json['approx_price'] as double?,
        displayPrice = json['display_price'] as bool?,
        isActive = json['is_active'] as bool?,
        brandId = json['brand_id'] as int?,
        unitId = json['unit_id'] as int?,
        cgst = json['cgst'],
        sgst = json['sgst'],
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        isFeatured = json['is_featured'] as bool?,
        unit = (json['unit'] as Map<String, dynamic>?) != null
            ? Unit.fromJson(json['unit'] as Map<String, dynamic>)
            : null,
        brand = (json['brand'] as Map<String, dynamic>?) != null
            ? Brand.fromJson(json['brand'] as Map<String, dynamic>)
            : null,
        colors = (json['colors'] as List?)
            ?.map((dynamic e) => AUIColors.fromJson(e as Map<String, dynamic>))
            .toList(),
        categories = (json['categories'] as List?)
            ?.map((dynamic e) => Categories.fromJson(e as Map<String, dynamic>))
            .toList(),
        pictures = (json['pictures'] as List?)
            ?.map((dynamic e) => Pictures.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'code': code,
        'highlight': highlight,
        'description': description,
        'approx_price': approxPrice,
        'display_price': displayPrice,
        'is_active': isActive,
        'brand_id': brandId,
        'unit_id': unitId,
        'cgst': cgst,
        'sgst': sgst,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'is_featured': isFeatured,
        'unit': unit?.toJson(),
        'brand': brand?.toJson(),
        'colors': colors?.map((e) => e.toJson()).toList(),
        'categories': categories?.map((e) => e.toJson()).toList(),
        'pictures': pictures?.map((e) => e.toJson()).toList()
      };
}

class Unit {
  final String? name;
  final int? volume;

  Unit({
    this.name,
    this.volume,
  });

  Unit.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        volume = json['volume'] as int?;

  Map<String, dynamic> toJson() => {'name': name, 'volume': volume};
}

class Brand {
  final int? id;
  final String? name;

  Brand({
    this.id,
    this.name,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class AUIColors {
  final int? id;
  final String? name;

  AUIColors({
    this.id,
    this.name,
  });

  AUIColors.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Categories {
  final int? id;
  final String? name;

  Categories({
    this.id,
    this.name,
  });

  Categories.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        name = json['name'] as String?;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class Pictures {
  int? order;
  String? title;
  String? url;

  Pictures({this.order, this.title, this.url});

  Pictures.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}

class ProductDetailErrorResponse {
  final int? code;
  final String? message;

  ProductDetailErrorResponse({
    this.code,
    this.message,
  });

  ProductDetailErrorResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
