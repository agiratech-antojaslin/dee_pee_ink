class AcceptQuoteBody {
  final int? id;

  AcceptQuoteBody({
    this.id,
  });

  AcceptQuoteBody.fromJson(Map<String, dynamic> json) : id = json['id'] as int?;

  Map<String, dynamic> toJson() => {'id': id};
}
