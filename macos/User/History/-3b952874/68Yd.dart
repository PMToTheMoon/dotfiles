part of 'auth_bloc.dart';

@freezed
class AuthBlocState with _$AuthBlocState {
  const AuthBlocState._();

  const factory AuthBlocState.unknown() = _AuthBlocState;
  const factory AuthBlocState.authenticated() = _AuthBlocState;
  const factory AuthBlocState.unauthenticated() = _AuthBlocState;
}
