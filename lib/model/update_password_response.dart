class UpdatePasswordResponse {
  int? code;
  String? message;

  UpdatePasswordResponse({
    this.code,
    this.message,
  });

  UpdatePasswordResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'] as int?;
    message = json['message'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['code'] = code;
    json['message'] = message;
    return json;
  }
}