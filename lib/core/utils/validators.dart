import '../constants/app_constants.dart';

/// Form validation utilities
/// Provides validation methods for common input fields
class Validators {
  // Prevent instantiation
  Validators._();

  // ============================================
  // Email Validation
  // ============================================

  /// Validate email address
  /// Returns error message if invalid, null if valid
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'L\'adresse email est requise';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length > AppConstants.maxEmailLength) {
      return 'L\'email ne peut pas dépasser ${AppConstants.maxEmailLength} caractères';
    }

    final emailRegex = RegExp(AppConstants.emailPattern);
    if (!emailRegex.hasMatch(trimmedValue)) {
      return 'Veuillez entrer une adresse email valide';
    }

    return null;
  }

  // ============================================
  // Password Validation
  // ============================================

  /// Validate password with strong password requirements
  /// Must contain: uppercase, lowercase, digit, special char
  /// Minimum 8 characters
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }

    if (value.length < AppConstants.minPasswordLength) {
      return 'Le mot de passe doit contenir au moins ${AppConstants.minPasswordLength} caractères';
    }

    // Check uppercase letter
    if (!RegExp(AppConstants.passwordUppercasePattern).hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins une majuscule';
    }

    // Check lowercase letter
    if (!RegExp(AppConstants.passwordLowercasePattern).hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins une minuscule';
    }

    // Check digit
    if (!RegExp(AppConstants.passwordDigitPattern).hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un chiffre';
    }

    // Check special character
    if (!RegExp(AppConstants.passwordSpecialCharPattern).hasMatch(value)) {
      return 'Le mot de passe doit contenir au moins un caractère spécial (!@#\$%^&*...)';
    }

    return null;
  }

  /// Validate password confirmation
  /// Checks if password and confirmation match
  static String? validateConfirmPassword(
    String? password,
    String? confirmPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'La confirmation du mot de passe est requise';
    }

    if (password != confirmPassword) {
      return 'Les mots de passe ne correspondent pas';
    }

    return null;
  }

  /// Simple password validation (for login)
  /// Only checks if not empty, no strength requirements
  static String? validatePasswordSimple(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est requis';
    }

    return null;
  }

  // ============================================
  // Name Validation
  // ============================================

  /// Validate name (first name, last name, full name)
  static String? validateName(String? value, {String fieldName = 'nom'}) {
    if (value == null || value.trim().isEmpty) {
      return 'Le $fieldName est requis';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length < 2) {
      return 'Le $fieldName doit contenir au moins 2 caractères';
    }

    if (trimmedValue.length > AppConstants.maxNameLength) {
      return 'Le $fieldName ne peut pas dépasser ${AppConstants.maxNameLength} caractères';
    }

    // Check if contains only letters, spaces, hyphens, apostrophes, accented chars
    final nameRegex = RegExp(AppConstants.namePattern);
    if (!nameRegex.hasMatch(trimmedValue)) {
      return 'Le $fieldName ne peut contenir que des lettres';
    }

    return null;
  }

  // ============================================
  // Required Field Validation
  // ============================================

  /// Generic required field validator
  static String? validateRequired(String? value, {String fieldName = 'champ'}) {
    if (value == null || value.trim().isEmpty) {
      return 'Le $fieldName est requis';
    }
    return null;
  }

  // ============================================
  // Phone Number Validation (International)
  // ============================================

  /// Validate international phone number
  /// Accepts E.164 format: +[country code][number]
  /// Examples: +243123456789 (RDC), +33612345678 (France), +1234567890 (USA)
  /// Length: 7-15 digits (excluding +)
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Le numéro de téléphone est requis';
    }

    final trimmedValue = value.trim().replaceAll(RegExp(r'\s+'), '');

    // International phone regex: +[1-9][0-9]{1-14}
    // Requires + and country code, total 8-15 characters
    final phoneRegex = RegExp(AppConstants.internationalPhonePattern);
    if (!phoneRegex.hasMatch(trimmedValue)) {
      return 'Veuillez entrer un numéro valide (ex: +243123456789)';
    }

    // Additional length validation
    if (trimmedValue.length < 8 || trimmedValue.length > 16) {
      return 'Le numéro doit contenir entre 8 et 15 chiffres';
    }

    return null;
  }

  /// Validate phone number (optional field)
  static String? validatePhoneOptional(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null; // Allow empty
    }

    return validatePhone(value);
  }

  // ============================================
  // Length Validation
  // ============================================

  /// Validate minimum length
  static String? validateMinLength(
    String? value,
    int minLength, {
    String fieldName = 'champ',
  }) {
    if (value == null || value.isEmpty) {
      return 'Le $fieldName est requis';
    }

    if (value.length < minLength) {
      return 'Le $fieldName doit contenir au moins $minLength caractères';
    }

    return null;
  }

  /// Validate maximum length
  static String? validateMaxLength(
    String? value,
    int maxLength, {
    String fieldName = 'champ',
  }) {
    if (value != null && value.length > maxLength) {
      return 'Le $fieldName ne peut pas dépasser $maxLength caractères';
    }

    return null;
  }

  // ============================================
  // Numeric Validation
  // ============================================

  /// Validate numeric input
  static String? validateNumeric(String? value, {String fieldName = 'champ'}) {
    if (value == null || value.isEmpty) {
      return 'Le $fieldName est requis';
    }

    final numericRegex = RegExp(AppConstants.numericPattern);
    if (!numericRegex.hasMatch(value)) {
      return 'Le $fieldName doit contenir uniquement des chiffres';
    }

    return null;
  }

  // ============================================
  // Helper Methods
  // ============================================

  /// Check if email format is valid (without returning error message)
  static bool isEmailValid(String? email) {
    if (email == null || email.isEmpty) return false;
    final emailRegex = RegExp(AppConstants.emailPattern);
    return emailRegex.hasMatch(email.trim());
  }

  /// Check if password is strong (meets all requirements)
  static bool isPasswordStrong(String? password) {
    if (password == null || password.isEmpty) return false;
    
    return password.length >= AppConstants.minPasswordLength &&
        RegExp(AppConstants.passwordUppercasePattern).hasMatch(password) &&
        RegExp(AppConstants.passwordLowercasePattern).hasMatch(password) &&
        RegExp(AppConstants.passwordDigitPattern).hasMatch(password) &&
        RegExp(AppConstants.passwordSpecialCharPattern).hasMatch(password);
  }

  /// Get password strength score (0-4)
  /// 0 = very weak, 1 = weak, 2 = medium, 3 = strong, 4 = very strong
  static int getPasswordStrength(String? password) {
    if (password == null || password.isEmpty) return 0;

    int score = 0;

    // Length check
    if (password.length >= AppConstants.minPasswordLength) score++;
    if (password.length >= 12) score++;

    // Character variety
    if (RegExp(AppConstants.passwordUppercasePattern).hasMatch(password)) score++;
    if (RegExp(AppConstants.passwordLowercasePattern).hasMatch(password)) score++;
    if (RegExp(AppConstants.passwordDigitPattern).hasMatch(password)) score++;
    if (RegExp(AppConstants.passwordSpecialCharPattern).hasMatch(password)) score++;

    // Cap at 4
    return score > 4 ? 4 : score;
  }
}