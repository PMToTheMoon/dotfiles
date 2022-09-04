part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const ForgotPasswordEvent._();

  const factory ForgotPasswordEvent.initialized() = ForgotPasswordInitialized;

  const factory ForgotPasswordEvent.hidePasswordPressed() =
      ForgotPasswordHidePasswordPressed;

  const factory ForgotPasswordEvent.formSubmitted({
    required String email,
    required String password,
  }) = ForgotPasswordFormSubmitted;
}
