part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();

  const factory LoginState.initial({
    String? savedEmail,
    bool? saveCredentials,
  }) = LoginInitial;
  const factory LoginState.idle() = LoginIdle;
  const factory LoginState.postForm() = LoginPostForm;
  const factory LoginState.success() = LoginSuccess;
  const factory LoginState.error() = LoginError;
}
