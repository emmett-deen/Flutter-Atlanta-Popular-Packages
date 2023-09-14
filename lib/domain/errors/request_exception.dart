class RequestException implements Exception {
  RequestException({
    required this.message,
    required this.statusCode,
  });
  final String message;
  final int statusCode;
}
