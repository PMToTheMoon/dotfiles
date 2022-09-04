import 'package:zanalys/user/user_service.dart';

abstract class StorageService {
  Future<void> init();

  Future<void> saveUser(User user);

  Future<User?> getUser();

  Future<void> saveRefreshToken(String? token);

  Future<void> saveBearerToken(String? token);

  Future<String?> getRefreshToken();

  Future<String?> getToken();

  Future<void> saveLastUserId(String? userId);

  Future<String?> getLastUserId();

  Future<void> saveKeepLastUserId(bool keep);

  Future<bool> keepLastUserId();

  Future<void> clearSession();
}
