class AddQuoteRequestWithOutIdResponse {
  final QuoteWo? quote;

  AddQuoteRequestWithOutIdResponse({
    this.quote,
  });

  AddQuoteRequestWithOutIdResponse.fromJson(Map<String, dynamic> json)
      : quote = (json['quote'] as Map<String, dynamic>?) != null
            ? QuoteWo.fromJson(json['quote'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'quote': quote?.toJson()};
}

class QuoteWo {
  final List<QuoteItemsWo>? quoteItems2;

  QuoteWo({
    this.quoteItems2,
  });

  QuoteWo.fromJson(Map<String, dynamic> json)
      : quoteItems2 = (json['quote_items'] as List?)
            ?.map(
                (dynamic e) => QuoteItemsWo.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'quote_items': quoteItems2?.map((e) => e.toJson()).toList()};
}

class QuoteItemsWo {
  final int? productId;
  final int? colorId;
  final int? quantity;

  QuoteItemsWo({
    this.productId,
    this.colorId,
    this.quantity,
  });

  QuoteItemsWo.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as int?,
        colorId = json['color_id'] as int?,
        quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() =>
      {'product_id': productId, 'color_id': colorId, 'quantity': quantity};
}
