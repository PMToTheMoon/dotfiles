part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.started() = AuthStarted;
  const factory AuthEvent.loginRequested({
    String email,
    String password,
  }) = AuthLogoutRequested;
  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
}
