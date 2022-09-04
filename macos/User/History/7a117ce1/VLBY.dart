abstract class BearerTokenProvider {
  String? get bearerToken;
  Future<String?> refreshToken();
}
