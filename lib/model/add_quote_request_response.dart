class AddQuoteRequestResponse {
  final Quote1? quote;

  AddQuoteRequestResponse({
    this.quote,
  });

  AddQuoteRequestResponse.fromJson(Map<String, dynamic> json)
      : quote = (json['quote'] as Map<String, dynamic>?) != null
            ? Quote1.fromJson(json['quote'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'quote': quote?.toJson()};
}

class Quote1 {
  final String? quoteId;
  final List<QuoteItems1>? quoteItems1;

  Quote1({
    this.quoteId,
    this.quoteItems1,
  });

  Quote1.fromJson(Map<String, dynamic> json)
      : quoteId = json['quote_id'] as String?,
        quoteItems1 = (json['quote_items'] as List?)
            ?.map(
                (dynamic e) => QuoteItems1.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() => {
        'quote_id': quoteId,
        'quote_items': quoteItems1?.map((e) => e.toJson()).toList()
      };
}

class QuoteItems1 {
  final int? productId;
  final int? colorId;
  final int? quantity;

  QuoteItems1({
    this.productId,
    this.colorId,
    this.quantity,
  });

  QuoteItems1.fromJson(Map<String, dynamic> json)
      : productId = json['product_id'] as int?,
        colorId = json['color_id'] as int?,
        quantity = json['quantity'] as int?;

  Map<String, dynamic> toJson() =>
      {'product_id': productId, 'color_id': colorId, 'quantity': quantity};
}
