part of 'auth_bloc.dart';

@freezed
class Authtate with _$AuthState {
  const AuthState._();

  const factory AuthState.unknown() = AuthUnknown;
  const factory AuthState.authenticated() = AuthAuthenticated;
  const factory AuthState.unauthenticated() = AuthUnauthenticated;
}
