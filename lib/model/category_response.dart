class CategoryResponse {
  int? code;
  List<Data>? data;
  int? totalCount;

  CategoryResponse({
    this.code,
    this.data,
    this.totalCount,
  });

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int?;
    data = (json['data'] as List?)?.map((dynamic e) => Data.fromJson(e as Map<String,dynamic>)).toList();
    totalCount = json['total_count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['code'] = code;
    json['data'] = data?.map((e) => e.toJson()).toList();
    json['total_count'] = totalCount;
    return json;
  }
}

class Data {
  int? id;
  Product? product;

  Data({
    this.id,
    this.product,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    product = (json['product'] as Map<String,dynamic>?) != null ? Product.fromJson(json['product'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['product'] = product?.toJson();
    return json;
  }
}

class Product {
  int? id;
  String? name;
  String? code;
  String? highlight;
  String? description;
  double? approxPrice;
  bool? displayPrice;
  bool? isActive;
  double? cgst;
  double? sgst;
  Unit? unit;
  Brand? brand;
  List<Colors>? colors;
  List<Categories>? categories;
  List<Pictures>? pictures;

  Product({
    this.id,
    this.name,
    this.code,
    this.highlight,
    this.description,
    this.approxPrice,
    this.displayPrice,
    this.isActive,
    this.cgst,
    this.sgst,
    this.unit,
    this.brand,
    this.colors,
    this.categories,
    this.pictures,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    code = json['code'] as String?;
    highlight = json['highlight'] as String?;
    description = json['description'] as String?;
    approxPrice = json['approx_price'] as double?;
    displayPrice = json['display_price'] as bool?;
    isActive = json['is_active'] as bool?;
    cgst = json['cgst'] as double?;
    sgst = json['sgst'] as double?;
    unit = (json['unit'] as Map<String,dynamic>?) != null ? Unit.fromJson(json['unit'] as Map<String,dynamic>) : null;
    brand = (json['brand'] as Map<String,dynamic>?) != null ? Brand.fromJson(json['brand'] as Map<String,dynamic>) : null;
    colors = (json['colors'] as List?)?.map((dynamic e) => Colors.fromJson(e as Map<String,dynamic>)).toList();
    categories = (json['categories'] as List?)?.map((dynamic e) => Categories.fromJson(e as Map<String,dynamic>)).toList();
    pictures = (json['pictures'] as List?)?.map((dynamic e) => Pictures.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['code'] = code;
    json['highlight'] = highlight;
    json['description'] = description;
    json['approx_price'] = approxPrice;
    json['display_price'] = displayPrice;
    json['is_active'] = isActive;
    json['cgst'] = cgst;
    json['sgst'] = sgst;
    json['unit'] = unit?.toJson();
    json['brand'] = brand?.toJson();
    json['colors'] = colors?.map((e) => e.toJson()).toList();
    json['categories'] = categories?.map((e) => e.toJson()).toList();
    json['pictures'] = pictures?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Unit {
  int? id;
  String? name;
  bool? isActive;
  int? volume;

  Unit({
    this.id,
    this.name,
    this.isActive,
    this.volume,
  });

  Unit.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    isActive = json['is_active'] as bool?;
    volume = json['volume'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['is_active'] = isActive;
    json['volume'] = volume;
    return json;
  }
}

class Brand {
  int? id;
  String? name;
  bool? isActive;

  Brand({
    this.id,
    this.name,
    this.isActive,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    isActive = json['is_active'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['is_active'] = isActive;
    return json;
  }
}

class Colors {
  int? id;
  String? name;
  bool? isActive;

  Colors({
    this.id,
    this.name,
    this.isActive,
  });

  Colors.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    isActive = json['is_active'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['is_active'] = isActive;
    return json;
  }
}

class Categories {
  int? id;
  String? name;
  bool? isActive;
  String? description;
  bool isEnabled=false;

  Categories({
    this.id,
    this.name,
    this.isActive,
    this.description,
    required this.isEnabled
  });

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    isActive = json['is_active'] as bool?;
    description = json['description'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['is_active'] = isActive;
    json['description'] = description;
    return json;
  }
}

class Pictures {
  int? id;
  int? order;
  String? title;
  String? pictureImageUrl;

  Pictures({
    this.id,
    this.order,
    this.title,
    this.pictureImageUrl,
  });

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    order = json['order'] as int?;
    title = json['title'] as String?;
    pictureImageUrl = json['picture_image_url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['order'] = order;
    json['title'] = title;
    json['picture_image_url'] = pictureImageUrl;
    return json;
  }
}