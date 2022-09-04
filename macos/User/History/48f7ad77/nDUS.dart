part of 'candidate_new_education_bloc.dart';

@freezed
class CandidateNewEducationState with _$CandidateNewEducationState {
  const CandidateNewEducationState._();

  const factory CandidateNewEducationState.idle() = CandidateNewEducationIdle;

  const factory CandidateNewEducationState.loading() =
      CandidateNewEducationLoading;

  const factory CandidateNewEducationState.error() = CandidateNewEducationError;

  const factory CandidateNewEducationState.success() =
      CandidateNewEducationSuccess;
}
