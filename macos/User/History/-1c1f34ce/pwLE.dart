part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$LoginState {
  const ForgotPasswordState._();

  const factory ForgotPasswordState.initial({
    String? email,
  }) = LoginInitialState;

  const factory ForgotPasswordState.loading() = LoginLoadingState;
  const factory ForgotPasswordState.success() = LoginSuccessState;
  const factory ForgotPasswordState.unexpected() = LoginUnexpectedErrorState;
  const factory ForgotPasswordState.unauthorized() = LoginUnauthorizedState;
}
