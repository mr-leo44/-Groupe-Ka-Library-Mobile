import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../constants/api_constants.dart';
import '../storage/secure_storage_service.dart';
import '../errors/exceptions.dart';

/// Interceptor for handling authentication and error responses
class ApiInterceptor extends Interceptor {
  final _logger = Logger();
  final _storage = SecureStorageService();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add authentication token if available
    final token = await _storage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      _logger.d('🔑 Token added to request: ${options.path}');
    }

    _logger.i('📤 REQUEST[${options.method}] => ${options.path}');
    
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    _logger.i(
      '📥 RESPONSE[${response.statusCode}] => ${response.requestOptions.path}',
    );
    
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    _logger.e(
      '❌ ERROR[${err.response?.statusCode}] => ${err.requestOptions.path}',
    );

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NetworkException(
          'Délai de connexion dépassé. Vérifiez votre connexion internet.',
        );

      case DioExceptionType.badResponse:
        _handleStatusCode(err.response?.statusCode, err.response?.data);
        break;

      case DioExceptionType.cancel:
        throw NetworkException('Requête annulée');

      case DioExceptionType.connectionError:
        throw NetworkException(
          'Impossible de se connecter au serveur. Vérifiez votre connexion internet.',
        );

      case DioExceptionType.badCertificate:
        throw NetworkException('Certificat SSL invalide');

      case DioExceptionType.unknown:
        throw NetworkException(
          'Erreur inconnue. Veuillez réessayer.',
        );
    }

    return handler.next(err);
  }

  /// Handle HTTP status codes
  void _handleStatusCode(int? statusCode, dynamic responseData) {
    String message = 'Une erreur est survenue';

    // Try to extract message from response
    if (responseData is Map<String, dynamic>) {
      message = responseData['message'] ?? message;
    }

    switch (statusCode) {
      case 400:
        throw ValidationException(message);

      case 401:
        _logger.w('⚠️  Token expired or invalid - clearing storage');
        _storage.clearAll(); // Clear token on 401
        throw UnauthorizedException(
          'Session expirée. Veuillez vous reconnecter.',
        );

      case 403:
        throw ForbiddenException(
          'Accès refusé. Vous n\'avez pas les permissions nécessaires.',
        );

      case 404:
        throw NotFoundException('Ressource introuvable');

      case 422:
        // Validation error from Laravel
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('errors')) {
          final errors = responseData['errors'] as Map<String, dynamic>;
          final firstError = errors.values.first;
          if (firstError is List && firstError.isNotEmpty) {
            message = firstError.first.toString();
          }
        }
        throw ValidationException(message);

      case 429:
        throw TooManyRequestsException(
          'Trop de tentatives. Veuillez patienter quelques instants.',
        );

      case 500:
      case 502:
      case 503:
      case 504:
        throw ServerException(
          'Erreur serveur. Veuillez réessayer plus tard.',
        );

      default:
        throw ServerException(message);
    }
  }
}