import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/storage/storage.dart';
import 'package:zanalys_api/zanalys_api.dart';

part 'exceptions.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated;

  final String identifier;
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

  final _authStatusStream = StreamController<AuthStatus>.broadcast();

  AuthStatus _authStatus;

  String? identifier;

  Stream<AuthStatus> get statusStream => _authStatusStream.stream;

  AuthStatus get status => _authStatus;

  // Token is received only after otp
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
      _notifyStatusChange(AuthStatus.authenticated);
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    await storage.clearSession();
    _notifyStatusChange(AuthStatus.unauthenticated);
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
      _notifyStatusChange(AuthStatus.authenticated);
    } catch (e) {
      await logout();
    }
  }

  void _notifyStatusChange(AuthStatus status) {
    _authStatus = status;
    _authStatusStream.add(_authStatus);
  }
}
