part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$LoginEvent {
  const ForgotPasswordEvent._();

  const factory ForgotPasswordEvent.initialized() = LoginInitialized;

  const factory ForgotPasswordEvent.hidePasswordPressed() =
      LoginHidePasswordPressed;

  const factory ForgotPasswordEvent.formSubmitted({
    required String email,
    required String password,
  }) = LoginFormSubmitted;
}
