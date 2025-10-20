import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../storage/secure_storage_service.dart';
import '../errors/exceptions.dart';
import '../constants/api_constants.dart';

class ApiInterceptor extends Interceptor {
  final Logger _logger = Logger();
  final SecureStorageService _storage;

  ApiInterceptor([SecureStorageService? storage])
    : _storage = storage ?? SecureStorageService();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getToken();
    if (token != null && token.isNotEmpty) {
      options.headers[ApiConstants.authorization] = ApiConstants.bearer(token);
      _logger.d('Token added to request: ${options.path}');
    }
    _logger.i('REQUEST[${options.method}] => ${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i(
      'RESPONSE[${response.statusCode}] => ${response.requestOptions.path}',
    );
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    _logger.e(
      'ERROR[${err.response?.statusCode}] => ${err.requestOptions.path}',
    );
    if (err.response != null) {
      _handleStatusCode(err.response!.statusCode, err.response!.data);
    }
    return handler.next(err);
  }

  void _handleStatusCode(int? statusCode, dynamic responseData) {
    String message = 'Une erreur est survenue';
    if (responseData is Map<String, dynamic>) {
      message = responseData['message'] ?? message;
    }

    switch (statusCode) {
      case 400:
        throw ValidationException(message);
      case 401:
        _storage.clearAll();
        throw UnauthorizedException(
          'Session expirée. Veuillez vous reconnecter.',
        );
      case 403:
        throw ForbiddenException('Accès refusé.');
      case 404:
        throw NotFoundException('Ressource introuvable');
      case 422:
        throw ValidationException(message);
      case 429:
        throw TooManyRequestsException('Trop de tentatives.');
      case 500:
      case 502:
      case 503:
      case 504:
        throw ServerException('Erreur serveur. Veuillez réessayer plus tard.');
      default:
        if ((statusCode ?? 500) >= 500)
          throw ServerException('Erreur serveur.');
        throw ServerException(message);
    }
  }
}
