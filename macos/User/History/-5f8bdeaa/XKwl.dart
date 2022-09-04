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
  }) : status = AuthStatus.unknown {
    _bearerToken = storageService.getString(_kBearerTokenKey);
  }

  final StorageService storageService;

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  AuthStatus get status => _status;

  AuthStatus _status;

  String? _bearerToken;

  @override
  String? get bearerToken => _bearerToken;

  @override
  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }

  Future<void> logout() async {}
}
