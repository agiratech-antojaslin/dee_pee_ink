class RequestQuoteResponse {
  final int? code;
  final String? message;

  RequestQuoteResponse({
    this.code,
    this.message,
  });

  RequestQuoteResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
