class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException(this._message, this._prefix);

  String toString() {
    return '$_prefix$_message';
  }
}

class DataException extends AppException {
  DataException([String? message]) : super(message, "Data Exception");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid request");
}

class UnauthorizedRequestException extends AppException {
  UnauthorizedRequestException([String? message])
      : super(message, "Unauthorized request");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message])
      : super(message, "Invalid input request");
}
