class ApiResponse<T> {
  final bool status;
  final String message;
  final T? data;

  ApiResponse({required this.status, required this.message, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>)? fromJson,
  ) {
    return ApiResponse<T>(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null && fromJson != null
          ? fromJson(json['data'])
          : null,
    );
  }
}
