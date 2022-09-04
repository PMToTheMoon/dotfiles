import 'dart:async';

import 'package:app_client/auth/auth.dart';
import 'package:hive/hive.dart';
import 'package:app_client/urban_driver_api/urban_driver_api.dart';
import 'package:app_client/urban_driver_api/models/sign_in/sign_in_request.dart'
    as ud;
import 'package:common/common.dart';

const String _kBoxKey = "auth_repository";
const String _kEmailKey = "email";
const String _kPasswordKey = "password";
const String _kTokenKey = "token";

enum AuthStatus { authenticated, unauthenticated }

// use urban_api to get a token
// store token
// refresh token if needed
class AuthRepository {
  Future<AuthRepository> init() async {
    _cache = await Hive.openBox(_kBoxKey);
    return this;
  }

  final UrbanDriverApiClient _urbanDriver = UrbanDriverApiClient();
  final _statusStream = StreamController<AuthStatus>.broadcast();
  late Box _cache;

  Stream<AuthStatus> get statusStream => _statusStream.stream;

  String? get cachedEmail => _cache.get(_kEmailKey);
  String? get cachedPassword => _cache.get(_kPasswordKey);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      final _email = email.trim();
      final _password = password.trim();
      final token = await _urbanDriver.login(
        email: _email,
        password: _password,
      );
      await Future.wait([
        _setCachedEmail(_email),
        _setCachedPassword(_password),
        _setCachedToken(token),
      ]);
      _statusStream.add(AuthStatus.authenticated);
    } on Unauthorized {
      await logout();
      rethrow;
    }
  }

  Future<String> sendSmsCode({
    required String phoneNumber,
  }) async {
    String data = phoneNumber.trim();
    if (data.startsWith("+")) {
      data = data.replaceFirst("+", "00");
    }
    return _urbanDriver.sendSmsVerificationCode(data);
  }

  Future<void> signin({
    required SignInRequest data,
  }) async {
    try {
      final _data = data.trim();

      await _urbanDriver.signin(ud.SignInRequest(
        firstName: _data.firstName,
        lastName: _data.lastName,
        phoneNumber: _data.phoneNumber,
        email: _data.email,
        password: _data.password,
        code: _data.code,
        codeHash: _data.codeHash,
      ));

      await login(
        email: _data.email,
        password: _data.password,
      );
    } on Unauthorized {
      await logout();
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    await Future.wait([
      _setCachedPassword(null),
      _setCachedToken(null),
    ]);
    _statusStream.add(AuthStatus.unauthenticated);
  }

  /// try to refresh auth token.
  /// return token if it's still valid or if it's successfully renewed
  /// return null otherwise.
  Future<void> refreshToken() async {
    final email = cachedEmail;
    final password = cachedPassword;
    if (email != null && password != null) {
      try {
        await login(email: email, password: password);
      } catch (e) {
        rethrow;
      }
    } else {
      _statusStream.add(AuthStatus.unauthenticated);
    }
  }

  String? getToken() => _cache.get(_kTokenKey);

  void dispose() {
    _statusStream.close();
    _cache.close();
  }

  String? get _cachedToken => _cache.get(_kTokenKey);

  Future<void> _setCachedEmail(String? val) => _cache.put(_kEmailKey, val);

  Future<void> _setCachedPassword(String? val) =>
      _cache.put(_kPasswordKey, val);

  Future<void> _setCachedToken(String? val) => _cache.put(_kTokenKey, val);
}
