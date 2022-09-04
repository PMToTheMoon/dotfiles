typedef BearerTokenProvider = String? Function();

typedef RefreshTokenCallback = FutureOr<void> Function();

abstract class AuthenticationProvider {
  String? get bearerToken;
  FutureOr<void> refreshBearerToken();
}
