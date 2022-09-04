import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/storage/storage.dart';
import 'package:zanalys_api/zanalys_api.dart';

part 'exceptions.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthService implements AuthenticationProvider {
  AuthService({
    required this.storage,
    required AppEnvironment environment,
  }) : _authStatus = AuthStatus.unknown {
    _client = ZanalysPublicApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
    );
  }

  final StorageService storage;

  late final ZanalysPublicApiClient _client;

  AuthStatus _authStatus;

  final _authStatusStream = StreamController<AuthStatus>.broadcast();

  AuthStatus get authStatus => _authStatus;

  Future<LogInStatus> login({
    required String identifier,
    required String password,
  }) =>
      _client.logIn(identifier: identifier, password: password);

  Future<bool> validateOTP({
    required String identifier,
    required String password,
    required String code,
  }) async {
    final session = await _client.validateOTP(
      identifier: identifier,
      password: password,
      code: code,
    );
    if (session != null) {
      await storage.saveRefreshToken(session.refreshToken);
      await storage.saveToken(session.token);
      await storage.saveUser(session.user);
      _authStatus = AuthStatus.authenticated;
      _authStatusStream.add(_authStatus);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await storage.clearSession();
    _authStatus = AuthStatus.unauthenticated;
    _authStatusStream.add(_authStatus);
  }

  @override
  Future<String?> getBearerToken() => storage.getToken();

  @override
  Future<void> refreshBearerToken() async {
    try {
      final refreshToken = await storage.getRefreshToken();
      if (refreshToken == null) throw 'refreshToken not found';
      final freshToken = await _client.refreshToken(refreshToken);
      if (freshToken == null) throw 'unable to refresh token';
      await storage.saveToken(freshToken);
    } catch (e) {
      await logout();
    }
  }
}
