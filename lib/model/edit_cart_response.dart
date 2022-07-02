class EditCartResponse {
  final int? code;
  final String? message;

  EditCartResponse({
    this.code,
    this.message,
  });

  EditCartResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        message = json['message'] as String?;

  Map<String, dynamic> toJson() => {'code': code, 'message': message};
}
