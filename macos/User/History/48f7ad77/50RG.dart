part of 'candidate_new_education_bloc.dart';

@freezed
class CandidateNewEductaionState with _$CandidateNewEductaionState {
  const CandidateNewEductaionState._();

  const factory CandidateNewEductaionState.idle() = CandidateNewEductaionIdle;

  const factory CandidateNewEductaionState.loading() =
      CandidateNewEductaionLoading;

  const factory CandidateNewEductaionState.error() = CandidateNewEductaionError;

  const factory CandidateNewEductaionState.success() =
      CandidateNewEductaionSuccess;
}
