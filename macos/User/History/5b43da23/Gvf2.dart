part of 'code_bloc.dart';

enum SignInFailure {
  InvalidCode,
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
}
