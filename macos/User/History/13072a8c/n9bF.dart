part of 'code_bloc.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.sendingCode() = CodeSending;

  const factory CodeState.codeSendError({
    String? error,
  }) = CodeSending;

  const factory CodeState.waitingSubmission({
    required String codeHash,
  }) = CodeWaitingSubmission;

  const factory CodeState.submittingCode({
    required String code,
    required String codeHash,
  }) = CodeSubmitting;

  const factory CodeState.invalidCode() = CodeInvalid;

  const factory CodeState.success() = CodeSuccess;
}
