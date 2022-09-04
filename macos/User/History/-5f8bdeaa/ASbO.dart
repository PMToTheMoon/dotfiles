import 'dart:async';

import 'package:tech_by_tech/storage/storage.dart';

const _kTokenKey = 'bearer_token';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository {
  AuthRepository({
    required this.storageService,
  }) : status = AuthStatus.unknown {
    token = storageService.getString(_kTokenKey);
  }

  final StorageService storageService;

  AuthStatus status;

  String? token;

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }

  Future<void> logout() async {}
}
