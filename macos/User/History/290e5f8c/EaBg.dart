import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/src/auth/auth_session.dart';

part 'auth_status.freezed.dart';
part 'auth_status.g.dart';

@freezed
class AuthStatus with _$AuthStatus {
  const AuthStatus._();

  const factory AuthStatus.unknown() = _Unknown;

  const factory AuthStatus.unauthenticated() = _Unauthenticated;

  const factory AuthStatus.authenticated({
    required AuthSession session,
  }) = _Authenticated;

  factory AuthStatus.fromJson(Map<String, dynamic> json) =>
      _$AuthStatusFromJson(json);
}
