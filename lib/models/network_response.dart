class APIResponse {
  dynamic message;
  dynamic data;
  dynamic success;

  APIResponse({required this.message, this.data, this.success});

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      success: json['status'] as dynamic,
      message: json['message'] as dynamic,
      data: json['data'] as dynamic
    );
  }
}