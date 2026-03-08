class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic originalError;

  ApiException(this.message, [this.statusCode, this.originalError]);

  @override
  String toString() => message;
}

class NetworkException extends ApiException {
  NetworkException([String? message])
      : super(message ?? 'İnternet bağlantısı yok', null);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String? message])
      : super(message ?? 'Yetkisiz erişim', 401);
}

class NotFoundException extends ApiException {
  NotFoundException([String? message])
      : super(message ?? 'Kaynak bulunamadı', 404);
}

class ServerException extends ApiException {
  ServerException([String? message])
      : super(message ?? 'Sunucu hatası', 500);
}

class ValidationException extends ApiException {
  final Map<String, dynamic>? errors;

  ValidationException([String? message, this.errors])
      : super(message ?? 'Doğrulama hatası', 422);
}
