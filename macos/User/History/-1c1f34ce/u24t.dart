part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const ForgotPasswordState._();

  const factory ForgotPasswordState.idle() = ForgotPasswordIdle;

  const factory ForgotPasswordState.loading() = ForgotPasswordLoadingState;
  const factory ForgotPasswordState.success() = ForgotPasswordSuccessState;
  const factory ForgotPasswordState.unexpected() =
      ForgotPasswordUnexpectedErrorState;
  const factory ForgotPasswordState.unauthorized() =
      ForgotPasswordUnauthorizedState;
}
