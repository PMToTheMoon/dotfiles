part of 'code_bloc.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.sendingCode() = CodeSending;

  const factory CodeState.codeSendError({
    String? error,
  }) = CodeSendError;

  const factory CodeState.waitingSubmission({
    required String codeHash,
  }) = CodeWaitingSubmission;

  const factory CodeState.submittingCode({
    required String code,
    required String codeHash,
  }) = CodeSubmitting;

  const factory CodeState.invalidCode({
    required String codeHash,
  }) = CodeInvalid;

  const factory CodeState.signInError({
    required SignInFailure reason,
  }) = CodeSignInError;

  const factory CodeState.signInSuccess() = CodeSuccess;
}
