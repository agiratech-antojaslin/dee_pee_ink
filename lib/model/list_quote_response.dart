class ListQuoteResponse {
  int? code;
  Data? data;

  ListQuoteResponse({
    this.code,
    this.data,
  });

  ListQuoteResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int?;
    data = (json['data'] as Map<String,dynamic>?) != null ? Data.fromJson(json['data'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['code'] = code;
    json['data'] = data?.toJson();
    return json;
  }
}

class Data {
  List<Quotes>? quotes;
  int? totalCount;

  Data({
    this.quotes,
    this.totalCount,
  });

  Data.fromJson(Map<String, dynamic> json) {
    quotes = (json['quotes'] as List?)?.map((dynamic e) => Quotes.fromJson(e as Map<String,dynamic>)).toList();
    totalCount = json['total_count'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['quotes'] = quotes?.map((e) => e.toJson()).toList();
    json['total_count'] = totalCount;
    return json;
  }
}

class Quotes {
  int? id;
  User? user;
  QuoteStatus? quoteStatus;
  String? respondedDate;
  int? respondedBy;
  String? expiryDate;
  String? requestedDate;
  String? code;
  double? totalAmount;
  dynamic createdByAdmin;
  double? totalApproxAmount;
  double? subTotal;
  double? cgstAmount;
  double? sgstAmount;
  Order? order;
  List<QuoteItems>? quoteItems;

  Quotes({
    this.id,
    this.user,
    this.quoteStatus,
    this.respondedDate,
    this.respondedBy,
    this.expiryDate,
    this.requestedDate,
    this.code,
    this.totalAmount,
    this.createdByAdmin,
    this.totalApproxAmount,
    this.subTotal,
    this.cgstAmount,
    this.sgstAmount,
    this.order,
    this.quoteItems,
  });

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    user = (json['user'] as Map<String,dynamic>?) != null ? User.fromJson(json['user'] as Map<String,dynamic>) : null;
    quoteStatus = (json['quote_status'] as Map<String,dynamic>?) != null ? QuoteStatus.fromJson(json['quote_status'] as Map<String,dynamic>) : null;
    respondedDate = json['responded_date'] as String?;
    respondedBy = json['responded_by'] as int?;
    expiryDate = json['expiry_date'] as String?;
    requestedDate = json['requested_date'] as String?;
    code = json['code'] as String?;
    totalAmount = json['total_amount'] as double?;
    createdByAdmin = json['created_by_admin'];
    totalApproxAmount = json['total_approx_amount'] as double?;
    subTotal = json['sub_total'] as double?;
    cgstAmount = json['cgst_amount'] as double?;
    sgstAmount = json['sgst_amount'] as double?;
    order = (json['order'] as Map<String,dynamic>?) != null ? Order.fromJson(json['order'] as Map<String,dynamic>) : null;
    quoteItems = (json['quote_items'] as List?)?.map((dynamic e) => QuoteItems.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['user'] = user?.toJson();
    json['quote_status'] = quoteStatus?.toJson();
    json['responded_date'] = respondedDate;
    json['responded_by'] = respondedBy;
    json['expiry_date'] = expiryDate;
    json['requested_date'] = requestedDate;
    json['code'] = code;
    json['total_amount'] = totalAmount;
    json['created_by_admin'] = createdByAdmin;
    json['total_approx_amount'] = totalApproxAmount;
    json['sub_total'] = subTotal;
    json['cgst_amount'] = cgstAmount;
    json['sgst_amount'] = sgstAmount;
    json['order'] = order?.toJson();
    json['quote_items'] = quoteItems?.map((e) => e.toJson()).toList();
    return json;


  }
  @override
  String toString() {
    return 'QuoteStatusModel{roundNumber: $quoteStatus}';
  }
}

class User {
  int? id;
  String? fullName;
  bool? isActive;
  bool? adminCreatedUser;
  String? mobileNumber;
  String? email;
  String? otp;
  String? otpCreatedAt;
  dynamic authToken;
  dynamic expiredIn;
  String? createdAt;
  String? updatedAt;
  bool? mobileNumberVerified;
  String? forgotOtp;
  String? forgotOtpCreatedAt;
  int? otpRequestCount;
  String? otpRequestedTime;
  String? otpInitialRequestTime;

  User({
    this.id,
    this.fullName,
    this.isActive,
    this.adminCreatedUser,
    this.mobileNumber,
    this.email,
    this.otp,
    this.otpCreatedAt,
    this.authToken,
    this.expiredIn,
    this.createdAt,
    this.updatedAt,
    this.mobileNumberVerified,
    this.forgotOtp,
    this.forgotOtpCreatedAt,
    this.otpRequestCount,
    this.otpRequestedTime,
    this.otpInitialRequestTime,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    fullName = json['full_name'] as String?;
    isActive = json['is_active'] as bool?;
    adminCreatedUser = json['admin_created_user'] as bool?;
    mobileNumber = json['mobile_number'] as String?;
    email = json['email'] as String?;
    otp = json['otp'] as String?;
    otpCreatedAt = json['otp_created_at'] as String?;
    authToken = json['auth_token'];
    expiredIn = json['expired_in'];
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
    mobileNumberVerified = json['mobile_number_verified'] as bool?;
    forgotOtp = json['forgot_otp'] as String?;
    forgotOtpCreatedAt = json['forgot_otp_created_at'] as String?;
    otpRequestCount = json['otp_request_count'] as int?;
    otpRequestedTime = json['otp_requested_time'] as String?;
    otpInitialRequestTime = json['otp_initial_request_time'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['full_name'] = fullName;
    json['is_active'] = isActive;
    json['admin_created_user'] = adminCreatedUser;
    json['mobile_number'] = mobileNumber;
    json['email'] = email;
    json['otp'] = otp;
    json['otp_created_at'] = otpCreatedAt;
    json['auth_token'] = authToken;
    json['expired_in'] = expiredIn;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
    json['mobile_number_verified'] = mobileNumberVerified;
    json['forgot_otp'] = forgotOtp;
    json['forgot_otp_created_at'] = forgotOtpCreatedAt;
    json['otp_request_count'] = otpRequestCount;
    json['otp_requested_time'] = otpRequestedTime;
    json['otp_initial_request_time'] = otpInitialRequestTime;
    return json;
  }
}

class QuoteStatus {
  int? id;
  String? name;

  QuoteStatus({
    this.id,
    this.name,
  });

  QuoteStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}

class Order {
  int? id;
  String? code;
  String? orderStatus;
  dynamic billingAddress;
  dynamic shippingAddress;
  dynamic deliveryNotes;
  dynamic deliveredOn;
  double? totalAmount;
  double? amountReceived;
  dynamic paymentMethod;
  dynamic expectedDeliveryDate;

  Order({
    this.id,
    this.code,
    this.orderStatus,
    this.billingAddress,
    this.shippingAddress,
    this.deliveryNotes,
    this.deliveredOn,
    this.totalAmount,
    this.amountReceived,
    this.paymentMethod,
    this.expectedDeliveryDate,
  });

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    code = json['code'] as String?;
    orderStatus = json['order_status'] as String?;
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    deliveryNotes = json['delivery_notes'];
    deliveredOn = json['delivered_on'];
    totalAmount = json['total_amount'] as double?;
    amountReceived = json['amount_received'] as double?;
    paymentMethod = json['payment_method'];
    expectedDeliveryDate = json['expected_delivery_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['code'] = code;
    json['order_status'] = orderStatus;
    json['billing_address'] = billingAddress;
    json['shipping_address'] = shippingAddress;
    json['delivery_notes'] = deliveryNotes;
    json['delivered_on'] = deliveredOn;
    json['total_amount'] = totalAmount;
    json['amount_received'] = amountReceived;
    json['payment_method'] = paymentMethod;
    json['expected_delivery_date'] = expectedDeliveryDate;
    return json;
  }
}

class QuoteItems {
  int? id;
  Color? color;
  int? quantity;
  double? offerPrice;
  dynamic offerCgst;
  dynamic offerSgst;
  double? individualTotalAmount;
  Product? product;

  QuoteItems({
    this.id,
    this.color,
    this.quantity,
    this.offerPrice,
    this.offerCgst,
    this.offerSgst,
    this.individualTotalAmount,
    this.product,
  });

  QuoteItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    color = (json['color'] as Map<String,dynamic>?) != null ? Color.fromJson(json['color'] as Map<String,dynamic>) : null;
    quantity = json['quantity'] as int?;
    offerPrice = json['offer_price'] as double?;
    offerCgst = json['offer_cgst'];
    offerSgst = json['offer_sgst'];
    individualTotalAmount = json['individual_total_amount'] as double?;
    product = (json['product'] as Map<String,dynamic>?) != null ? Product.fromJson(json['product'] as Map<String,dynamic>) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['color'] = color?.toJson();
    json['quantity'] = quantity;
    json['offer_price'] = offerPrice;
    json['offer_cgst'] = offerCgst;
    json['offer_sgst'] = offerSgst;
    json['individual_total_amount'] = individualTotalAmount;
    json['product'] = product?.toJson();
    return json;
  }
}

class Color {
  int? id;
  String? name;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Color({
    this.id,
    this.name,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
    isActive = json['is_active'] as bool?;
    createdAt = json['created_at'] as String?;
    updatedAt = json['updated_at'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['is_active'] = isActive;
    json['created_at'] = createdAt;
    json['updated_at'] = updatedAt;
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
  Brand? brand;
  Unit? unit;
  double? cgst;
  double? sgst;
  bool? isFeatured;
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
    this.brand,
    this.unit,
    this.cgst,
    this.sgst,
    this.isFeatured,
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
    brand = (json['brand'] as Map<String,dynamic>?) != null ? Brand.fromJson(json['brand'] as Map<String,dynamic>) : null;
    unit = (json['unit'] as Map<String,dynamic>?) != null ? Unit.fromJson(json['unit'] as Map<String,dynamic>) : null;
    cgst = json['cgst'] as double?;
    sgst = json['sgst'] as double?;
    isFeatured = json['is_featured'] as bool?;
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
    json['brand'] = brand?.toJson();
    json['unit'] = unit?.toJson();
    json['cgst'] = cgst;
    json['sgst'] = sgst;
    json['is_featured'] = isFeatured;
    json['colors'] = colors?.map((e) => e.toJson()).toList();
    json['categories'] = categories?.map((e) => e.toJson()).toList();
    json['pictures'] = pictures?.map((e) => e.toJson()).toList();
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

  Categories({
    this.id,
    this.name,
    this.isActive,
    this.description,
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
  String? title;
  int? order;
  String? url;

  Pictures({
    this.id,
    this.title,
    this.order,
    this.url,
  });

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    title = json['title'] as String?;
    order = json['order'] as int?;
    url = json['url'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['order'] = order;
    json['url'] = url;
    return json;
  }
}