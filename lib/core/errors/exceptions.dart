/// Base class for all custom exceptions
/// Used in the data layer to represent errors from external sources
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, [this.code]);

  @override
  String toString() => code != null ? '[$code] $message' : message;
}

/// Server-related exceptions (5xx errors)
class ServerException extends AppException {
  const ServerException([
    String message = 'Erreur serveur',
    String? code,
  ]) : super(message, code);
}

/// Network-related exceptions (connection issues)
class NetworkException extends AppException {
  const NetworkException([
    String message = 'Erreur de connexion',
    String? code,
  ]) : super(message, code);
}

/// Cache/Storage-related exceptions
class CacheException extends AppException {
  const CacheException([
    String message = 'Erreur de cache',
    String? code,
  ]) : super(message, code);
}

/// Validation exceptions (400, 422 errors)
class ValidationException extends AppException {
  const ValidationException([
    String message = 'Données invalides',
    String? code,
  ]) : super(message, code);
}

/// Authentication exceptions (401 errors)
class UnauthorizedException extends AppException {
  const UnauthorizedException([
    String message = 'Non autorisé',
    String? code,
  ]) : super(message, code);
}

/// Permission exceptions (403 errors)
class ForbiddenException extends AppException {
  const ForbiddenException([
    String message = 'Accès interdit',
    String? code,
  ]) : super(message, code);
}

/// Not found exceptions (404 errors)
class NotFoundException extends AppException {
  const NotFoundException([
    String message = 'Ressource introuvable',
    String? code,
  ]) : super(message, code);
}

/// Rate limit exceptions (429 errors)
class TooManyRequestsException extends AppException {
  const TooManyRequestsException([
    String message = 'Trop de requêtes',
    String? code,
  ]) : super(message, code);
}

/// Timeout exceptions
class TimeoutException extends AppException {
  const TimeoutException([
    String message = 'Délai dépassé',
    String? code,
  ]) : super(message, code);
}

/// JSON parsing exceptions
class ParseException extends AppException {
  const ParseException([
    String message = 'Erreur de parsing',
    String? code,
  ]) : super(message, code);
}
