import 'package:zanalys/user/user.dart';

abstract class StorageService {
  Future<void> init();

  Future<void> saveUser(User user);

  Future<User?> getUser();

  Future<void> saveRefreshToken(String? token);

  Future<void> saveToken(String? token);

  Future<String?> getRefreshToken();

  Future<String?> getToken();

  Future<void> saveLastUserId(String? userId);

  Future<String?> getLastUserId();

  Future<void> saveKeepLastUserId(bool keep);

  Future<bool> keepLastUserId();

  Future<void> clearSession();
}
