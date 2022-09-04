import 'dart:async';

import 'package:tech_by_tech/storage/storage.dart';

enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository {
  AuthRepository({
    required this.storageService,
  }) : status = AuthStatus.unknown;

  final StorageService storageService;

  AuthStatus status;

  String? token;

  final _statusStreamController = StreamController<AuthStatus>.broadcast();

  Stream<AuthStatus> get statusStream => _statusStreamController.stream;

  Future<void> init() async {}

  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }

  Future<void> logout() async {}
}
