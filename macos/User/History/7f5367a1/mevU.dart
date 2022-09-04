part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const SignInEvent._();

  const factory SignInEvent.formSubmitted({
    required SignInRequest data,
  }) = SignInFormSubmitted;
  const factory SignInEvent.fromRefused() = SignInFormRefused;
  const factory SignInEvent.fromValidated() = SignInFormValidated;
  const factory SignInEvent.codeValidated() = SignInCodeValidated;
  const factory SignInEvent.codeRefused() = SignInCodeRefused;
}
