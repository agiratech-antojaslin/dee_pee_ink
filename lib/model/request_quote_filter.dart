class RequestQuote {
  final int? id;

  RequestQuote({
    this.id,
  });

  RequestQuote.fromJson(Map<String, dynamic> json) : id = json['id'] as int?;

  Map<String, dynamic> toJson() => {'id': id};
}
