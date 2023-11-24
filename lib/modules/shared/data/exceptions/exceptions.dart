class ServerException {
  ServerException({
    required this.message,
    required this.statusCode,
    required this.data,
  });

  final String message;
  final int statusCode;
  final dynamic data;
}

class ParseException {
  ParseException({
    required this.message,
    required this.data,
  }) : stackTrace = StackTrace.current;

  final String message;
  final dynamic data;
  final StackTrace stackTrace;
}
