part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const ForgotPasswordState._();

  const factory ForgotPasswordState.idle() = ForgotPasswordIdle;

  const factory ForgotPasswordState.requestingReset() =
      ForgotPasswordRequestingReset;
  const factory ForgotPasswordState.success() = ForgotPasswordSuccess;
  const factory ForgotPasswordState.error() = ForgotPasswordError;
}
