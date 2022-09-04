import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zanalys/user/models/user.dart';
import 'package:zanalys/data/storage/storage_service.dart';

class SecureStorageService implements StorageService {
  static const String _keyUser = 'user';
  static const String _keyRefreshToken = 'refreshToken';
  static const String _keyToken = 'token';

  late FlutterSecureStorage storage;

  @override
  Future<void> init() async {
    storage = const FlutterSecureStorage();
  }

  @override
  Future<void> saveUser(User user) async {
    await storage.write(key: _keyUser, value: jsonEncode(user.toJson()));
  }

  @override
  Future<User?> getUser() async {
    String? value = await storage.read(key: _keyUser);
    if (value == null) {
      return null;
    }
    return User.fromJson(jsonDecode(value));
  }

  @override
  Future<void> saveRefreshToken(String? token) async {
    await storage.write(key: _keyRefreshToken, value: token);
  }

  @override
  Future<String?> getRefreshToken() {
    return storage.read(key: _keyRefreshToken);
  }

  @override
  Future<void> saveToken(String? token) async {
    await storage.write(key: _keyToken, value: token);
  }

  @override
  Future<String?> getToken() {
    return storage.read(key: _keyToken);
  }

  @override
  Future<void> clearSession() async {
    return storage.deleteAll();
  }
}
