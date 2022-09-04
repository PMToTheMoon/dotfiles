enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository {
  AuthRepository() : status = AuthStatus.unknown;

  AuthStatus status;

  String? token;

  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }
}
