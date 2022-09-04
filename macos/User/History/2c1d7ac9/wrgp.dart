part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const ForgotPasswordEvent._();

  const factory ForgotPasswordEvent.resetRequested({
    required String email,
  }) = ForgotPasswordInitialized;

  const factory ForgotPasswordEvent.resetLinkSuccessfullySent() =
      ForgotPasswordResetLinkSuccessfullySent;

  const factory ForgotPasswordEvent.resetRequestFailed() =
      ForgotPasswordResetRequestFailed;
}
