part of 'candidate_bloc.dart';

@freezed
class CandidateEvent with _$CandidateEvent {
  const factory CandidateEvent.started() = CandidateStarted;
}
