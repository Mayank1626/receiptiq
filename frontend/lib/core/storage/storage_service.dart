import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage;
  late final Box _prefsBox;

  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  StorageService(this._secureStorage);

  Future<void> init() async {
    await Hive.initFlutter();
    _prefsBox = await Hive.openBox('app_preferences');
  }

  // Tokens
  Future<void> saveTokens({required String accessToken, required String refreshToken}) async {
    await _secureStorage.write(key: _accessTokenKey, value: accessToken);
    await _secureStorage.write(key: _refreshTokenKey, value: refreshToken);
  }

  Future<String?> getAccessToken() async {
    return await _secureStorage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await _secureStorage.read(key: _refreshTokenKey);
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: _accessTokenKey);
    await _secureStorage.delete(key: _refreshTokenKey);
  }

  // Preferences
  Future<void> setBool(String key, bool value) async {
    await _prefsBox.put(key, value);
  }

  bool getBool(String key, {bool defaultValue = false}) {
    return _prefsBox.get(key, defaultValue: defaultValue);
  }

  // Cached User Data
  Future<void> saveCachedUser(String userJson) async {
    await _prefsBox.put('cached_user', userJson);
  }

  String? getCachedUser() {
    return _prefsBox.get('cached_user');
  }

  Future<void> clearCachedUser() async {
    await _prefsBox.delete('cached_user');
  }

  // Cached Dashboard Data
  Future<void> saveCachedDashboard(String dashboardJson) async {
    await _prefsBox.put('cached_dashboard', dashboardJson);
  }

  String? getCachedDashboard() {
    return _prefsBox.get('cached_dashboard');
  }

  Future<void> clearCachedDashboard() async {
    await _prefsBox.delete('cached_dashboard');
  }
}
