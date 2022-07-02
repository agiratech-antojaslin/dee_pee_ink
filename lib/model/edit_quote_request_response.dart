class EditQuoteRequestResponse {
  final Quote? quote;

  EditQuoteRequestResponse({
    this.quote,
  });

  EditQuoteRequestResponse.fromJson(Map<String, dynamic> json)
      : quote = (json['quote'] as Map<String, dynamic>?) != null
            ? Quote.fromJson(json['quote'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'quote': quote?.toJson()};
}

class Quote {
  final List<QuoteItemsEdit>? quoteItems;

  Quote({
    this.quoteItems,
  });

  Quote.fromJson(Map<String, dynamic> json)
      : quoteItems = (json['quote_items'] as List?)
            ?.map((dynamic e) =>
                QuoteItemsEdit.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'quote_items': quoteItems?.map((e) => e.toJson()).toList()};
}

class QuoteItemsEdit {
  final int? id;
  final int? productId;
  final int? quantity;
  final int? colorId;

  QuoteItemsEdit({
    this.id,
    this.productId,
    this.quantity,
    this.colorId,
  });

  QuoteItemsEdit.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        productId = json['product_id'] as int?,
        quantity = json['quantity'] as int?,
        colorId = json['color_id'] as int?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'quantity': quantity,
        'color_id': colorId
      };
}
