part of 'candidate_bloc.dart';

@freezed
class CandidateState with _$CandidateState {
  const factory CandidateState.initial() = CandidateStateInitial;
  const factory CandidateState.loading() = CandidateStateLoading;
  const factory CandidateState.ready() = CandidateStateReady;
  const factory CandidateState.error() = CandidateStateError;
}
