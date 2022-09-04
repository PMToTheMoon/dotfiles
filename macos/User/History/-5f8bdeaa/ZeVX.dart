import 'dart:async';

import 'package:models/models.dart';
import 'package:tech_by_tech/storage/storage.dart';

const _kBearerTokenKey = 'bearer_token';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository implements BearerTokenProvider {
  AuthRepository({
    required this.storageService,
  }) : _status = AuthStatus.unknown {
    _bearerToken = storageService.getString(_kBearerTokenKey);
  }

  final StorageService storageService;

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  AuthStatus _status;

  String? _bearerToken;

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  AuthStatus get status => _status;

  @override
  String? get bearerToken => _bearerToken;

  @override
  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }

  Future<void> logout() async {
    _status = AuthStatus.unauthenticated;
    _bearerToken = null;
    storageService.remove(_kBearerTokenKey);
  }
}
