import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:zanalys/user/user_service.dart';

import 'storage_service.dart';

class SecureStorageService implements StorageService {
  static const String _keyUser = "user";
  static const String _keyRefreshToken = "refreshToken";
  static const String _keyToken = "token";
  static const String _keyLastUserId = "lastUserId";
  static const String _keyKeepLastUserId = "keepLastUserId";

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
  Future<void> saveLastUserId(String? userId) {
    return storage.write(key: _keyLastUserId, value: userId);
  }

  @override
  Future<String?> getLastUserId() {
    return storage.read(key: _keyLastUserId);
  }

  @override
  Future<void> saveBearerToken(String? token) async {
    await storage.write(key: _keyToken, value: token);
  }

  @override
  Future<String?> getToken() {
    return storage.read(key: _keyToken);
  }

  @override
  Future<bool> keepLastUserId() async {
    String? keep = await storage.read(key: _keyKeepLastUserId);
    return keep == "true";
  }

  @override
  Future<void> saveKeepLastUserId(bool keep) async {
    await storage.write(
        key: _keyKeepLastUserId, value: keep ? "true" : "false");
  }

  @override
  Future<void> clearSession() async {
    await storage.delete(key: _keyUser);
    await storage.delete(key: _keyToken);
    await storage.delete(key: _keyRefreshToken);
    bool keep = await keepLastUserId();
    if (!keep) {
      await storage.delete(key: _keyKeepLastUserId);
    }
  }
}
