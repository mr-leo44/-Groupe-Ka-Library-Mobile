/// Defines API endpoints and constants used throughout the app.
///
/// Handles both authentication and user management routes.
/// Change [baseUrl] using `--dart-define` at build time to support
/// multiple environments (dev, staging, prod).
///
/// Example:
/// ```bash
/// flutter run --dart-define=API_BASE_URL=https://api.example.com/api
/// ```

class ApiConstants {
  ApiConstants._();

  /// Base URL for API — configurable by environment
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://book-api.test/api',
  );

  // ===========================================================================
  // Utility
  // ===========================================================================
  /// Returns the full URL by combining [baseUrl] with [path].
  static String endpoint(String path) => '$baseUrl$path';

  // ===========================================================================
  // Authentication
  // ===========================================================================
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String socialLogin = '/auth/social';
  static const String logout = '/auth/logout';
  static const String logoutAll = '/auth/logout-all';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String resendVerification = '/auth/email/resend';

  static String emailVerify(int id, String hash) =>
      '/auth/email/verify/$id/$hash';

  // ===========================================================================
  // User Profile
  // ===========================================================================
  static const String getProfile = '/user/profile';
  static const String updateProfile = '/user/profile';
  static const String changePassword = '/user/change-password';
  static const String getSessions = '/user/sessions';
  static String revokeSession(int tokenId) => '/user/sessions/$tokenId';

  // ===========================================================================
  // Headers
  // ===========================================================================
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String authorization = 'Authorization';

  /// Returns the full bearer token header value.
  static String bearer(String token) => 'Bearer $token';

  // ===========================================================================
  // Response Keys
  // ===========================================================================
  static const String successKey = 'success';
  static const String dataKey = 'data';
  static const String messageKey = 'message';
  static const String errorsKey = 'errors';
  static const String tokenKey = 'token';
  static const String userKey = 'user';
}
