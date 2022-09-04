@freezed
class AuthStatus with _$AuthStatus {
  const AuthStatus._();

  const factory AuthStatus.unknown() = AuthStatusUnknown;
  const factory AuthStatus.unauthenticated() = AuthStatusUnauthenticated;
  const factory AuthStatus.authenticated({
    required String userId,
    required String email,
    required bool isAdmin,
    required bool isBusinessPartner,
    required bool isTalentCoach,
    required bool isCandidate,
    required bool isClient,
    required bool isRpo,
}
  }) = AuthStatusAuthenticated;
}
