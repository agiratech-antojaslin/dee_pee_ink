class ProductListResponse {
  int? code;
  Data? data;

  ProductListResponse({this.code, this.data});

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Products>? products;
  int? totalCount;

  Data({this.products, this.totalCount});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['total_count'] = this.totalCount;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? code;
  double? approxPrice;
  bool? displayPrice;
  double? cgst;
  double? sgst;
  Unit? unit;
  List<ProductColors>? colors;
  List<Pictures>? pictures;

  Products(
      {this.id,
      this.name,
      this.code,
      this.approxPrice,
      this.displayPrice,
      this.cgst,
      this.sgst,
      this.unit,
      this.colors,
      this.pictures});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    approxPrice = json['approx_price'];
    displayPrice = json['display_price'];
    cgst = json['cgst'];
    sgst = json['sgst'];
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
    if (json['colors'] != null) {
      colors = <ProductColors>[];
      json['colors'].forEach((v) {
        colors!.add(new ProductColors.fromJson(v));
      });
    }
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(new Pictures.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['approx_price'] = this.approxPrice;
    data['display_price'] = this.displayPrice;
    data['cgst'] = this.cgst;
    data['sgst'] = this.sgst;
    if (this.unit != null) {
      data['unit'] = this.unit!.toJson();
    }
    if (this.colors != null) {
      data['colors'] = this.colors!.map((v) => v.toJson()).toList();
    }
    if (this.pictures != null) {
      data['pictures'] = this.pictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Unit {
  String? name;
  int? volume;

  Unit({this.name, this.volume});

  Unit.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['volume'] = this.volume;
    return data;
  }
}

class ProductColors {
  int? id;
  String? name;

  ProductColors({this.id, this.name});

  ProductColors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
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
