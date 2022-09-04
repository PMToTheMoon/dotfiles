part of 'candidate_profile_bloc.dart';

@freezed
class CandidateProfileEvent with _$CandidateProfileEvent {
  const factory CandidateProfileEvent.started() = CandidateProfileStarted;
}
