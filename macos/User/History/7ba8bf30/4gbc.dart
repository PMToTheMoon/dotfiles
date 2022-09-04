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

  Future<void> removeSavedAuthStatus() async {
    await storageService.remove(_kAuthStatusKey);
  }

  String? _savedEmail() => storageService.getString(_kEmailKey);

  Future<void> _saveEmail(String email) async {
    final result = await storageService.setString(_kEmailKey, email);
    if (result == false) {
      throw 'Unable to save email';
    }
  }

  Future<void> _removeSavedEmail(String email) async {
    await storageService.remove(_kEmailKey);
  }

  Future<AuthRepository> init() async {
    _status = savedAuthStatus() ?? const AuthStatus.unauthenticated();
    _statusStreamController.add(_status);
    return this;
  }

  @override
  Future<String?> refreshToken() async {
    // TODO: refresh token
    return null;
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

    _status = AuthStatus.authenticated(
      bearerToken: data.authToken,
      userId: data.userId,
      isAdmin: data.isAdmin,
      isBusinessPartner: data.isBusinessPartner,
      isTalentCoach: data.isTalentCoach,
      isCandidate: data.isCandidate,
      isClient: data.isClient,
      isRpo: data.isRpo,
    );

    if (preferencesRepository.saveCredentials) {
      await saveAuthStatus(status);
    } else {
      await removeSavedAuthStatus();
    }

    _statusStreamController.add(_status);
  }

  Future<void> logout() async {
    _status = const AuthStatus.unauthenticated();
    if (preferencesRepository.saveCredentials == false) {
      await storageService.remove(_kEmailKey);
      await storageService.
    }
    _statusStreamController.add(_status);
  }
}
