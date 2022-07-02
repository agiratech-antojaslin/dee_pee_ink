class CartDeleteBody {
  final int? id;
  final int? quoteItemsId;

  CartDeleteBody({
    this.id,
    this.quoteItemsId,
  });

  CartDeleteBody.fromJson(Map<String, dynamic> json)
    : id = json['id'] as int?,
      quoteItemsId = json['quote_items_id'] as int?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'quote_items_id' : quoteItemsId
  };
}