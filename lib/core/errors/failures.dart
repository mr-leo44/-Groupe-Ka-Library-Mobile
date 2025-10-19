import 'package:equatable/equatable.dart';

/// Base class for all failures
/// Used in the domain/presentation layer to represent errors
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message;
}

/// Server-related failures (5xx errors)
class ServerFailure extends Failure {
  const ServerFailure([
    String message = 'Erreur serveur. Veuillez réessayer plus tard.',
  ]) : super(message);
}

/// Network-related failures (connection issues)
class NetworkFailure extends Failure {
  const NetworkFailure([
    String message = 'Erreur de connexion. Vérifiez votre connexion internet.',
  ]) : super(message);
}

/// Cache/Storage-related failures
class CacheFailure extends Failure {
  const CacheFailure([
    String message = 'Erreur de stockage local.',
  ]) : super(message);
}

/// Validation failures (400, 422 errors)
class ValidationFailure extends Failure {
  const ValidationFailure([
    String message = 'Données invalides. Veuillez vérifier vos informations.',
  ]) : super(message);
}

/// Authentication failures (401 errors)
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([
    String message = 'Session expirée. Veuillez vous reconnecter.',
  ]) : super(message);
}

/// Permission failures (403 errors)
class ForbiddenFailure extends Failure {
  const ForbiddenFailure([
    String message = 'Accès refusé. Vous n\'avez pas les permissions nécessaires.',
  ]) : super(message);
}

/// Not found failures (404 errors)
class NotFoundFailure extends Failure {
  const NotFoundFailure([
    String message = 'Ressource introuvable.',
  ]) : super(message);
}

/// Rate limit failures (429 errors)
class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure([
    String message = 'Trop de tentatives. Veuillez patienter quelques instants.',
  ]) : super(message);
}

/// Generic failure for unknown errors
class UnknownFailure extends Failure {
  const UnknownFailure([
    String message = 'Une erreur inattendue est survenue.',
  ]) : super(message);
}
