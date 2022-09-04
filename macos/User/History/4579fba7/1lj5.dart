part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.postForm() = LoginPostForm;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.error() = LoginError;
}
