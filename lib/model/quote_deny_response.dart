class QuoteDenyResponse {
  final int? code;
  final String? message;

  QuoteDenyResponse({
    this.code,
    this.message,
  });

  QuoteDenyResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
