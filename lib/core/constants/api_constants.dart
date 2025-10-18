/// API endpoints and configuration constants
class ApiConstants {
  ApiConstants._();

  /// Base URL for API (Valet Linux local development)
  /// Change this in production to your actual API URL
  static const String baseUrl = 'http://book-api.test/api';

  // ============================================================================
  // Authentication Endpoints
  // ============================================================================

  /// POST - Register new user
  static const String register = '/auth/register';

  /// POST - Login with email/password
  static const String login = '/auth/login';

  /// POST - Social login (Google/Apple)
  static const String socialLogin = '/auth/social';

  /// POST - Logout current device
  static const String logout = '/auth/logout';

  /// POST - Logout all devices
  static const String logoutAll = '/auth/logout-all';

  /// POST - Request password reset link
  static const String forgotPassword = '/auth/forgot-password';

  /// POST - Reset password with token
  static const String resetPassword = '/auth/reset-password';

  /// POST - Resend email verification
  static const String resendVerification = '/auth/email/resend';

  /// GET - Verify email (called from email link)
  static String emailVerify(int id, String hash) =>
      '/auth/email/verify/$id/$hash';

  // ============================================================================
  // User Profile Endpoints
  // ============================================================================

  /// GET - Get current user profile
  static const String getProfile = '/user/profile';

  /// PUT - Update user profile
  static const String updateProfile = '/user/profile';

  /// POST - Change password
  static const String changePassword = '/user/change-password';

  /// GET - List active sessions
  static const String getSessions = '/user/sessions';

  /// DELETE - Revoke specific session
  static String revokeSession(int tokenId) => '/user/sessions/$tokenId';

  // ============================================================================
  // HTTP Headers
  // ============================================================================

  /// Content-Type header
  static const String contentType = 'application/json';

  /// Accept header
  static const String accept = 'application/json';

  /// Authorization header key
  static const String authorization = 'Authorization';

  /// Bearer token prefix
  static const String bearerPrefix = 'Bearer';

  // ============================================================================
  // API Response Keys
  // ============================================================================

  /// Success key in API response
  static const String successKey = 'success';

  /// Data key in API response
  static const String dataKey = 'data';

  /// Message key in API response
  static const String messageKey = 'message';

  /// Errors key in API response
  static const String errorsKey = 'errors';

  /// Token key in auth response
  static const String tokenKey = 'token';

  /// User key in auth response
  static const String userKey = 'user';
}