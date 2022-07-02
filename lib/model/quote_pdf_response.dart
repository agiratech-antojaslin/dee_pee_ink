class QuotePDFResponse {
  final int? code;
  final String? data;

  QuotePDFResponse({
    this.code,
    this.data,
  });

  QuotePDFResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'] as int?,
        data = json['data'] as String?;

  Map<String, dynamic> toJson() => {
    'code' : code,
    'data' : data
  };
}