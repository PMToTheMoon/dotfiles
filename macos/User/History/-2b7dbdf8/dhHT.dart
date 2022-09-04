@freezed
class AuthStatus with _$AuthStatus {
  const AuthStatus._();

  const factory AuthStatus.unknown() = AuthStatusUnknown;
  const factory AuthStatus.unauthenticated() = AuthStatusUnauthenticated;
  const factory AuthStatus.authenticated({
    required String userId,
    required String id,
  }) = AuthStatusAuthenticated;
}
