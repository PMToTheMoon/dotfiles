part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.started() = AuthStarted;
  const factory AuthEvent.loginRequested() = AuthLoginRequested;
  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;
  const factory AuthEvent._authStatusChanged() = _AuthStatusChanged;
}
