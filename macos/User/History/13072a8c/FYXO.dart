part of 'code_bloc.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.waitingSubmission({
    required String phoneNumber,
    String phoneNumber,
  }) = CodeWaitingSubmission;

  const factory CodeState.submittingCode({
    required String phoneNumber,
    required String code,
  }) = CodeSubmitting;

  const factory CodeState.invalidCode({
    required String phoneNumber,
  }) = CodeInvalid;

  const factory CodeState.success({
    required String phoneNumber,
  }) = CodeSuccess;
}
