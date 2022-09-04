part of 'code_bloc.dart';

@freezed
class CodeState with _$CodeState {
  const factory CodeState.waitingSubmission() = CodeWaitingSubmission;

  const factory CodeState.submittingCode({
    required String code,
  }) = CodeSubmitting;

  const factory CodeState.invalidCode() = CodeInvalid;

  const factory CodeState.success() = CodeSuccess;
}
