/// An interface to define a bearer token based auth provider.
///
/// This interface meant to be used inside API clients for authenticated
/// requests. This class is intended to be implemented by an authentication
/// repository that will also manage caching of the token.
abstract class BearerTokenProvider {
  String? get bearerToken;
  Future<String?> refreshToken();
}
