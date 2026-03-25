import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  // Single instance used everywhere in the app
  static const _storage = FlutterSecureStorage();

  // Key names — like variable names for the storage
  static const _keyToken = 'jwt_token';
  static const _keyEmail = 'user_email';

  // ── SAVE token after login ──────────────────────────────
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  // ── READ token when app opens ───────────────────────────
  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  // ── DELETE token on logout ──────────────────────────────
  static Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

  // ── CHECK if user is logged in ──────────────────────────
  static Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: _keyToken);
    return token != null; // true if token exists
  }

  // ── SAVE email (useful to show on profile screen) ───────
  static Future<void> saveEmail(String email) async {
    await _storage.write(key: _keyEmail, value: email);
  }

  // ── READ email ──────────────────────────────────────────
  static Future<String?> getEmail() async {
    return await _storage.read(key: _keyEmail);
  }
}
