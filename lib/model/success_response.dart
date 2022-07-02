class SuccessResponse {
  final int? code;
  final String? message;

  SuccessResponse({
    this.code,
    this.message,
  });

  SuccessResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
