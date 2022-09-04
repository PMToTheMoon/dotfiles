part of 'candidate_edit_education_bloc.dart';

@freezed
class CandidateEditEducationState with _$CandidateEditEducationState {
  const CandidateEditEducationState._();

  const factory CandidateEditEducationState.idle() = CandidateEditEducationIdle;

  const factory CandidateEditEducationState.loading() =
      CandidateEditEducationLoading;

  const factory CandidateEditEducationState.error() =
      CandidateEditEducationError;

  const factory CandidateEditEducationState.success() =
      CandidateEditEducationSuccess;
}
