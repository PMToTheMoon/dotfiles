part of 'candidate_bloc.dart';

@freezed
class CandidateState with _$CandidateState {
  const factory CandidateState.initial() = CandidateInitial;
  const factory CandidateState.loading() = CandidateLoading;
  const factory CandidateState.ready() = CandidateReady;
  const factory CandidateState.error() = CandidateError;
}
