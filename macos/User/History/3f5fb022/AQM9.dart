import 'dart:async';
import 'dart:math';

import 'package:models/models.dart';
import 'package:tech_by_tech/storage/preferences_repository.dart';
import 'package:tech_by_tech/storage/storage.dart';

const _kBearerTokenKey = 'bearer_token';
const _kEmailKey = 'email';

enum AuthStatus {
  /// Unknown state is used to support async op at initialization
  /// (ie: refresh token at startup) while let the ability to the app to show
  /// interface (actually splash screen)
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository implements BearerTokenProvider {
  AuthRepository({
    required this.preferencesRepository,
    required this.storageService,
  }) : _status = AuthStatus.unknown;

  final StorageService storageService;
  final PreferencesRepository preferencesRepository;

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  AuthStatus _status;

  String? _bearerToken;
  String? _savedEmail;

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  AuthStatus get status => _status;

  String? get savedEmail => _savedEmail;

  Future<AuthRepository> init() async {
    _savedEmail = storageService.getString(_kEmailKey);
    _bearerToken = storageService.getString(_kBearerTokenKey);
    // TODO: refresh token ?
    if (_bearerToken != null) {
      _status = AuthStatus.authenticated;
    } else {
      _status = AuthStatus.unauthenticated;
    }
    _statusStreamController.add(_status);
    return this;
  }

  @override
  String? get bearerToken => _bearerToken;

  @override
  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }

  Future<void> login({
    required String email,
    required String password,
    required bool saveCredentials,
  }) async {
    // Todo: Implement api request
    const token = 'not_null';
    _bearerToken = token;
    _savedEmail = email;
    await preferencesRepository.setSaveCredentials(true);
    if (saveCredentials) {
      await storageService.setString(_kBearerTokenKey, token);
      await storageService.setString(_kEmailKey, email);
    } else {
      await storageService.remove(_kEmailKey);
    }
    _status = AuthStatus.authenticated;
    _statusStreamController.add(_status);
  }

  Future<void> logout() async {
    _status = AuthStatus.unauthenticated;
    _bearerToken = null;
    await storageService.remove(_kBearerTokenKey);
    _statusStreamController.add(_status);
  }
}
