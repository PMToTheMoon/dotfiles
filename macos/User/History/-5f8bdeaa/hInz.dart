enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository {
  AuthStatus status;

  String? token;

  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }
}
