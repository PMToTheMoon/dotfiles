part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.authenticated({
    required User user,
  }) = Authenticated;

  User? get user => mapOrNull(authenticated: (auth) => auth.user);
}
