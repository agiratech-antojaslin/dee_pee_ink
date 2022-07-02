class ErrorResponse {
  final int? code;
  final String? message;

  ErrorResponse({
    this.code,
    this.message,
  });

  ErrorResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
