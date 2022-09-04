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

  //used by other repository to access private api
  late final TbtPrivateClient tbtPrivateClient = TbtPrivateClient(this);

  final TbtPublicClient _client = TbtPublicClient();

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  AuthStatus _status;
  String? _email;

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  AuthStatus get status => _status;
  String? get email => _email;

  Future<AuthRepository> init() async {
    _status = _savedAuthStatus() ?? const AuthStatus.unauthenticated();
    _email = _savedEmail();
    _statusStreamController.add(_status);
    return this;
  }

  @override
  String? get bearerToken =>
      _status.mapOrNull(authenticated: (data) => data.bearerToken);

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

    _email = email;
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
      await _saveAuthStatus(status);
      await _saveEmail(email);
    } else {
      await _removeSavedAuthStatus();
      await _removeSavedEmail();
    }

    _statusStreamController.add(_status);
  }

  Future<void> logout() async {
    _status = const AuthStatus.unauthenticated();
    await _removeSavedAuthStatus();
    if (preferencesRepository.saveCredentials == false) {
      await _removeSavedEmail();
    }
    _statusStreamController.add(_status);
  }

  AuthStatus? _savedAuthStatus() {
    final saved = storageService.getString(_kAuthStatusKey);
    if (saved == null) return null;
    return AuthStatus.fromJson(jsonDecode(saved));
  }

  Future<void> _saveAuthStatus(AuthStatus status) async {
    final result =
        await storageService.setString(_kAuthStatusKey, jsonEncode(status));
    if (result == false) {
      throw 'Unable to save auth status';
    }
  }

  Future<void> _removeSavedAuthStatus() async {
    await storageService.remove(_kAuthStatusKey);
  }

  String? _savedEmail() => storageService.getString(_kEmailKey);

  Future<void> _saveEmail(String email) async {
    final result = await storageService.setString(_kEmailKey, email);
    if (result == false) {
      throw 'Unable to save email';
    }
  }

  Future<void> _removeSavedEmail() async {
    await storageService.remove(_kEmailKey);
  }
}
