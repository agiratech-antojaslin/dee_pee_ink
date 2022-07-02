class ListQuotePostFilter {
  final ListQuote? quote;

  ListQuotePostFilter({
    this.quote,
  });

  ListQuotePostFilter.fromJson(Map<String, dynamic> json)
      : quote = (json['quote'] as Map<String, dynamic>?) != null
            ? ListQuote.fromJson(json['quote'] as Map<String, dynamic>)
            : null;

  Map<String, dynamic> toJson() => {'quote': quote?.toJson()};
}

class ListQuote {
  final String? orderBy;
  final String? search;
  final int? status;
  final int? page;
  final int? perPage;

  ListQuote({
    this.orderBy,
    this.search,
    this.status,
    this.page,
    this.perPage,
  });

  ListQuote.fromJson(Map<String, dynamic> json)
      : orderBy = json['order_by'] as String?,
        search = json['search'] as String?,
        status = json['status'] as int?,
        page = json['page'] as int?,
        perPage = json['per_page'] as int?;

  Map<String, dynamic> toJson() => {
        'order_by': orderBy,
        'search': search,
        'status': status,
        'page': page,
        'per_page': perPage
      };
}
