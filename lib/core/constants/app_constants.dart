/// Application-wide constants
class AppConstants {
  AppConstants._();

  // ============================================================================
  // Storage Keys
  // ============================================================================

  /// Key for storing authentication token
  static const String authTokenKey = 'auth_token';

  /// Key for storing user data
  static const String userDataKey = 'user_data';

  /// Key for storing device name
  static const String deviceNameKey = 'device_name';

  /// Key for storing "remember me" preference
  static const String rememberMeKey = 'remember_me';

  /// Key for storing last email used
  static const String lastEmailKey = 'last_email';

  // ============================================================================
  // Network Timeouts
  // ============================================================================

  /// Connection timeout duration
  static const Duration connectionTimeout = Duration(seconds: 30);

  /// Receive timeout duration
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Send timeout duration
  static const Duration sendTimeout = Duration(seconds: 30);

  // ============================================================================
  // Validation Rules
  // ============================================================================

  /// Minimum password length
  static const int minPasswordLength = 8;

  /// Maximum password length
  static const int maxPasswordLength = 128;

  /// Maximum name length
  static const int maxNameLength = 255;

  /// Maximum email length
  static const int maxEmailLength = 255;

  /// Email regex pattern
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Password regex pattern (min 8, letters, mixed case, numbers, symbols)
  static const String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  // ============================================================================
  // UI Constants
  // ============================================================================

  /// Default padding value
  static const double defaultPadding = 16.0;

  /// Small padding value
  static const double smallPadding = 8.0;

  /// Large padding value
  static const double largePadding = 24.0;

  /// Extra large padding value
  static const double extraLargePadding = 32.0;

  /// Default border radius
  static const double borderRadius = 12.0;

  /// Large border radius
  static const double largeBorderRadius = 20.0;

  /// Button height
  static const double buttonHeight = 56.0;

  /// Text field height
  static const double textFieldHeight = 56.0;

  /// Animation duration
  static const Duration animationDuration = Duration(milliseconds: 300);

  /// Short animation duration
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);

  /// Long animation duration
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  /// Debounce duration for search/input
  static const Duration debounceDuration = Duration(milliseconds: 500);

  // ============================================================================
  // Device Information
  // ============================================================================

  /// Default device name for Android
  static const String defaultAndroidDeviceName = 'Android App';

  /// Default device name for iOS
  static const String defaultIosDeviceName = 'iOS App';

  /// Default device name fallback
  static const String defaultDeviceName = 'Mobile App';

  // ============================================================================
  // App Information
  // ============================================================================

  /// App name
  static const String appName = 'Groupe Ka Library';

  /// App version (should match pubspec.yaml)
  static const String appVersion = '1.0.0';

  // ============================================================================
  // Error Messages
  // ============================================================================

  /// Generic error message
  static const String genericErrorMessage =
      'Une erreur est survenue. Veuillez réessayer.';

  /// Network error message
  static const String networkErrorMessage =
      'Erreur de connexion. Vérifiez votre connexion internet.';

  /// Timeout error message
  static const String timeoutErrorMessage =
      'La requête a expiré. Veuillez réessayer.';

  /// Unauthorized error message
  static const String unauthorizedErrorMessage =
      'Session expirée. Veuillez vous reconnecter.';

  /// Server error message
  static const String serverErrorMessage =
      'Erreur serveur. Veuillez réessayer plus tard.';
}