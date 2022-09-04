part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.started() = _AuthEvent;
  const factory AuthEvent.logoutRequested() = _AuthEvent;
}
