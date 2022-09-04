import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_status.freezed.dart';

@freezed
class Session with _$AuthStatus {
  const Session._();

  const factory Session.unknown() = AuthStatusUnknown;
  const factory Session.unauthenticated() = AuthStatusUnauthenticated;
  const factory Session.authenticated({
    required String userId,
    required String email,
    required bool isAdmin,
    required bool isBusinessPartner,
    required bool isTalentCoach,
    required bool isCandidate,
    required bool isClient,
    required bool isRpo,
  }) = AuthStatusAuthenticated;
}
