class AppException implements Exception {
  final _message;
  final _prefix;
  AppException(this._message, this._prefix);
  String toString() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error dduring communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'invalid request');
}

class UnAuthorizedRequest extends AppException {
  UnAuthorizedRequest([String? message])
      : super(message, 'Error dduring communication');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'ivalid request');
}
