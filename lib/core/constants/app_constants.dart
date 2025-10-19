/// ============================================================================
/// AppConstants
/// ============================================================================
/// Ce fichier regroupe toutes les constantes globales de l’application.
/// Utilisé pour éviter les valeurs magiques et centraliser la configuration.
///
/// Auteur : Lionel Kaniki
/// Projet : Groupe Ka Library
/// Version : 1.0.0
/// ============================================================================

class AppConstants {
  AppConstants._(); // Empêche l’instanciation de la classe

  // ============================================================================
  // STORAGE KEYS
  // ============================================================================

  /// Clé pour le token d’authentification
  static const String authTokenKey = 'auth_token';

  /// Clé pour les données de l’utilisateur connecté
  static const String userDataKey = 'user_data';

  /// Clé pour le nom de l’appareil
  static const String deviceNameKey = 'device_name';

  /// Clé pour l’option "Se souvenir de moi"
  static const String rememberMeKey = 'remember_me';

  /// Clé pour stocker le dernier email utilisé
  static const String lastEmailKey = 'last_email';

  // ============================================================================
  // NETWORK TIMEOUTS
  // ============================================================================

  /// Délai maximum de connexion
  static const Duration connectionTimeout = Duration(seconds: 30);

  /// Délai maximum de réception
  static const Duration receiveTimeout = Duration(seconds: 30);

  /// Délai maximum d’envoi
  static const Duration sendTimeout = Duration(seconds: 30);

  // ============================================================================
  // API RESPONSE CODES
  // ============================================================================

  static const int statusCodeSuccess = 200;
  static const int statusCodeUnauthorized = 401;
  static const int statusCodeNotFound = 404;
  static const int statusCodeServerError = 500;

  // ============================================================================
  // VALIDATION RULES
  // ============================================================================

  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int maxNameLength = 255;
  static const int maxEmailLength = 255;

  /// Email : accepte nom@domaine.tld
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Mot de passe : majuscule, minuscule, chiffre et caractère spécial requis
  static const String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  static const String passwordUppercasePattern = r'[A-Z]';
  static const String passwordLowercasePattern = r'[a-z]';
  static const String passwordDigitPattern = r'[0-9]';
  static const String passwordSpecialCharPattern =
      r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\\/]';

  /// Téléphone international : +243123456789, +33612345678, etc.
  static const String internationalPhonePattern = r'^\+?[1-9]\d{1,14}$';

  /// Numérique uniquement
  static const String numericPattern = r'^[0-9]+$';

  /// Noms : lettres, accents, espaces, tirets et apostrophes
  static const String namePattern = r"^[a-zA-ZÀ-ÿ\s\-\']+$";

  // ============================================================================
  // ERROR MESSAGES
  // ============================================================================

  static const String genericErrorMessage =
      'Une erreur est survenue. Veuillez réessayer.';

  static const String networkErrorMessage =
      'Erreur de connexion. Vérifiez votre connexion internet.';

  static const String timeoutErrorMessage =
      'La requête a expiré. Veuillez réessayer.';

  static const String unauthorizedErrorMessage =
      'Session expirée. Veuillez vous reconnecter.';

  static const String serverErrorMessage =
      'Erreur serveur. Veuillez réessayer plus tard.';

  // ============================================================================
  // COMMON UI TEXTS
  // ============================================================================

  static const String okText = 'OK';
  static const String cancelText = 'Annuler';
  static const String retryText = 'Réessayer';
  static const String confirmText = 'Confirmer';
  static const String logoutText = 'Se déconnecter';

  // ============================================================================
  // UI CONSTANTS
  // ============================================================================

  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  static const double borderRadius = 12.0;
  static const double largeBorderRadius = 20.0;

  static const double buttonHeight = 56.0;
  static const double textFieldHeight = 56.0;

  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration shortAnimationDuration = Duration(milliseconds: 150);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  /// Délai d’attente avant une recherche ou saisie (anti-spam)
  static const Duration debounceDuration = Duration(milliseconds: 500);

  // ============================================================================
  // DEVICE INFORMATION
  // ============================================================================

  static const String defaultAndroidDeviceName = 'Android App';
  static const String defaultIosDeviceName = 'iOS App';
  static const String defaultDeviceName = 'Mobile App';

  /// User-Agent utilisé dans les requêtes API
  static const String userAgent =
      'GroupeKaLibraryApp/1.0.0 (Flutter; Mobile)';

  // ============================================================================
  // APP INFORMATION
  // ============================================================================

  static const String appName = 'Groupe Ka Library';
  static const String appVersion = '1.0.0';
}
