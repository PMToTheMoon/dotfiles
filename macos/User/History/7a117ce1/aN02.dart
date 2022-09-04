/// An interface to define a bearer based token auth provider,
/// to be used inside API client
abstract class BearerTokenProvider {
  String? get bearerToken;
  Future<String?> refreshToken();
}
