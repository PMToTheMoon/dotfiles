import 'dart:async';
import 'dart:convert';

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/storage/preferences_repository.dart';
import 'package:tech_by_tech/storage/storage.dart';

import 'auth_status.dart';

export 'auth_status.dart';

const _kAuthStatusKey = 'auth_status';
const _kEmailKey = 'email';

class AuthRepository implements BearerTokenProvider {
  AuthRepository({
    required this.preferencesRepository,
    required this.storageService,
  }) : _status = const AuthStatus.unknown();

  final StorageService storageService;
  final PreferencesRepository preferencesRepository;

  final TbtPublicClient _client = TbtPublicClient();

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  AuthStatus _status;

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  AuthStatus get status => _status;

  AuthStatus? savedAuthStatus() {
    final saved = storageService.getString(_kAuthStatusKey);
    if (saved == null) return null;
    return AuthStatus.fromJson(jsonDecode(saved));
  }

  Future<void> saveAuthStatus(AuthStatus status) async {
    final result =
        await storageService.setString(_kAuthStatusKey, jsonEncode(status));
    if (result == false) {
      throw 'Unable to save auth status';
    }
  }

  String? savedEmail() => storageService.getString(_kEmailKey);

  String? saveEmail() {
    final result =
        await storageService.setString(_kEmailKey, jsonEncode(status));
    if (result == false) {
      throw 'Unable to save auth status';
    }
  };

  Future<AuthRepository> init() async {
    // TODO: refresh token ?
    if (bearerToken != null) {
      _status = AuthStatus.authenticated(
        email: 'email',
        userId: '',
      );
    } else {
      _status = const AuthStatus.unauthenticated();
    }
    _statusStreamController.add(_status);
    return this;
  }

  @override
  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final res = await _client.auth.login(LoginRequest(
      username: email,
      password: password,
    ));
    final data = res.body!;

    final token = data.authToken;
    _status = AuthStatus.authenticated(
      userId: data.userId,
      email: data.email,
      isAdmin: data.isAdmin,
      isBusinessPartner: data.isBusinessPartner,
      isTalentCoach: data.isTalentCoach,
      isCandidate: data.isCandidate,
      isClient: data.isClient,
      isRpo: data.isRpo,
    );

    if (preferencesRepository.saveCredentials) {
      await storageService.setString(_kBearerTokenKey, token);
      await storageService.setString(_kEmailKey, email);
    } else {
      await storageService.remove(_kEmailKey);
    }

    _statusStreamController.add(_status);
  }

  Future<void> logout() async {
    _status = const AuthStatus.unauthenticated();
    await storageService.remove(_kBearerTokenKey);
    if (preferencesRepository.saveCredentials == false) {
      await storageService.remove(_kEmailKey);
    }
    _statusStreamController.add(_status);
  }
}
