part of 'code_bloc.dart';

enum SignInFailure {
  EmailExist,
  Unknown,
}

@freezed
abstract class CodeEvent {
  const factory CodeEvent.codeSent({
    required String codeHash,
  }) = CodeSent;
  const factory CodeEvent.failedSendCode({
    required String error,
  }) = CodeFailedSend;
  const factory CodeEvent.codeSubmitted({
    required String code,
  }) = CodeSubmitted;
  const factory CodeEvent.codeValidated() = CodeValidated;

  const factory CodeEvent.codeRefused() = CodeRefused;

  const factory CodeEvent.signInFailed({
    required SignInFailure reason,
  }) = CodeSignInFailed;

  const factory CodeEvent.signInSucceed() = CodeSignInSucceed;

  const factory CodeEvent.logInFailed() = CodeLogInFailed;

  const factory CodeEvent.logInSucceed() = CodeLogInSucceed;
}
