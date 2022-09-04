import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const AuthStatus._();

  const factory AuthStatus.unknown() = AuthStatusUnknown;
  const factory AuthStatus.unauthenticated() = AuthStatusUnauthenticated;
  const factory AuthStatus.authenticated({
    required String userId,
    required bool isAdmin,
    required bool isBusinessPartner,
    required bool isTalentCoach,
    required bool isCandidate,
    required bool isClient,
    required bool isRpo,
  }) = AuthStatusAuthenticated;
}
