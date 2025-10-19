import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import '../constants/app_constants.dart';

/// Service for secure local storage using FlutterSecureStorage
/// Stores sensitive data like authentication tokens and user data
class SecureStorageService {
  static final SecureStorageService _instance = SecureStorageService._internal();
  
  factory SecureStorageService() => _instance;
  
  SecureStorageService._internal();

  final _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  final _logger = Logger();

  // ============================================
  // Authentication Token Management
  // ============================================

  /// Save authentication token securely
  Future<void> saveToken(String token) async {
    try {
      await _storage.write(
        key: AppConstants.authTokenKey,
        value: token,
      );
      _logger.d('🔐 Token saved successfully');
    } catch (e) {
      _logger.e('❌ Error saving token: $e');
      rethrow;
    }
  }

  /// Retrieve authentication token
  Future<String?> getToken() async {
    try {
      final token = await _storage.read(key: AppConstants.authTokenKey);
      if (token != null) {
        _logger.d('🔑 Token retrieved successfully');
      }
      return token;
    } catch (e) {
      _logger.e('❌ Error reading token: $e');
      return null;
    }
  }

  /// Delete authentication token
  Future<void> deleteToken() async {
    try {
      await _storage.delete(key: AppConstants.authTokenKey);
      _logger.d('🗑️  Token deleted successfully');
    } catch (e) {
      _logger.e('❌ Error deleting token: $e');
      rethrow;
    }
  }

  /// Check if user is authenticated (has valid token)
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  // ============================================
  // User Data Management
  // ============================================

  /// Save user data as JSON string
  Future<void> saveUserData(String userData) async {
    try {
      await _storage.write(
        key: AppConstants.userDataKey,
        value: userData,
      );
      _logger.d('👤 User data saved successfully');
    } catch (e) {
      _logger.e('❌ Error saving user data: $e');
      rethrow;
    }
  }

  /// Retrieve user data JSON string
  Future<String?> getUserData() async {
    try {
      final userData = await _storage.read(key: AppConstants.userDataKey);
      if (userData != null) {
        _logger.d('👤 User data retrieved successfully');
      }
      return userData;
    } catch (e) {
      _logger.e('❌ Error reading user data: $e');
      return null;
    }
  }

  /// Delete user data
  Future<void> deleteUserData() async {
    try {
      await _storage.delete(key: AppConstants.userDataKey);
      _logger.d('🗑️  User data deleted successfully');
    } catch (e) {
      _logger.e('❌ Error deleting user data: $e');
      rethrow;
    }
  }

  // ============================================
  // Device Management
  // ============================================

  /// Save device name for session identification
  Future<void> saveDeviceName(String deviceName) async {
    try {
      await _storage.write(
        key: AppConstants.deviceNameKey,
        value: deviceName,
      );
      _logger.d('📱 Device name saved: $deviceName');
    } catch (e) {
      _logger.e('❌ Error saving device name: $e');
      rethrow;
    }
  }

  /// Retrieve device name
  Future<String?> getDeviceName() async {
    try {
      final deviceName = await _storage.read(key: AppConstants.deviceNameKey);
      return deviceName;
    } catch (e) {
      _logger.e('❌ Error reading device name: $e');
      return null;
    }
  }

  /// Delete device name
  Future<void> deleteDeviceName() async {
    try {
      await _storage.delete(key: AppConstants.deviceNameKey);
      _logger.d('🗑️  Device name deleted');
    } catch (e) {
      _logger.e('❌ Error deleting device name: $e');
      rethrow;
    }
  }

  // ============================================
  // Remember Me Functionality
  // ============================================

  /// Save remember me preference
  Future<void> saveRememberMe(bool rememberMe) async {
    try {
      await _storage.write(
        key: AppConstants.rememberMeKey,
        value: rememberMe.toString(),
      );
      _logger.d('💾 Remember me preference saved: $rememberMe');
    } catch (e) {
      _logger.e('❌ Error saving remember me: $e');
      rethrow;
    }
  }

  /// Get remember me preference
  Future<bool> getRememberMe() async {
    try {
      final value = await _storage.read(key: AppConstants.rememberMeKey);
      return value == 'true';
    } catch (e) {
      _logger.e('❌ Error reading remember me: $e');
      return false;
    }
  }

  // ============================================
  // Clear All Data (Logout)
  // ============================================

  /// Clear all stored data (used on logout)
  Future<void> clearAll() async {
    try {
      await _storage.deleteAll();
      _logger.w('🧹 All secure storage cleared');
    } catch (e) {
      _logger.e('❌ Error clearing storage: $e');
      rethrow;
    }
  }

  /// Clear only authentication data (keep device preferences)
  Future<void> clearAuthData() async {
    try {
      await deleteToken();
      await deleteUserData();
      _logger.w('🧹 Authentication data cleared');
    } catch (e) {
      _logger.e('❌ Error clearing auth data: $e');
      rethrow;
    }
  }

  // ============================================
  // Debug & Development
  // ============================================

  /// Get all stored keys (for debugging)
  Future<Map<String, String>> getAllData() async {
    try {
      return await _storage.readAll();
    } catch (e) {
      _logger.e('❌ Error reading all data: $e');
      return {};
    }
  }

  /// Check if storage contains a specific key
  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(key: key);
    } catch (e) {
      _logger.e('❌ Error checking key: $e');
      return false;
    }
  }
}