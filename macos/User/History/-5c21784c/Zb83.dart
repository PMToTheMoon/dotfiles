import 'dart:async';
import 'dart:html';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

part 'exceptions.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

class AuthenticationService implements AuthenticationProvider {
  AuthenticationService({
    required this.storage,
    required AppEnvironment environment,
  }) : _authStatus = AuthenticationStatus.unauthenticated {
    _client = ZanalysPublicApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
    );
  }

  final StorageService storage;

  late final ZanalysPublicApiClient _client;

  AuthenticationStatus _authStatus;

  final _authStatusStream = StreamController<AuthenticationStatus>.broadcast();

  AuthenticationStatus get authenticationStatus => _authStatus;

  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    final status =
        await _client.logIn(identifier: identifier, password: password);
    if (status is LogInStatusAutheticated) {}
  }

  Future<void> logout() async {
    await storage.clearSession();
    _authStatus = AuthenticationStatus.unauthenticated;
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
