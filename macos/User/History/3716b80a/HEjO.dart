part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const SignInState._();

  const factory SignInState.waitingFormSubmission() =
      SignInWaitingFormSubmission;

  const factory SignInState.submittingForm({
    required SignInRequest data,
  }) = SignInSubmittingForm;

  const factory SignInState.invalidForm() = SignInInvalidForm;

  const factory SignInState.waitingCodeValidation() =
      SignInWaitingCodeValidation;

  const factory SignInState.invalidCode() = SignInInvalidCode;

  const factory SignInState.success() = SignInSuccess;
}
