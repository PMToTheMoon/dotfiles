import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/auth/session.dart';

part 'auth_status.freezed.dart';
part 'auth_status.g.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const AuthStatus._();

  const factory AuthStatus.unknown() = UnknownAuthStatus;

  const factory AuthStatus.unauthenticated() = Unauthenticated;

  const factory AuthStatus.authenticated({
    required Session session,
  }) = Authenticated;

  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);
}
