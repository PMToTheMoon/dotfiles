enum AuthStatus {
  unknown,
  authenticated,
  unauthenticated,
}

class AuthRepository {
  String? token;

  Future<String?> refreshToken() async {
    throw UnimplementedError();
  }
}
