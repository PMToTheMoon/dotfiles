part of 'candidate_profile_bloc.dart';

@freezed
class CandidateProfileState with _$CandidateProfileState {
  const CandidateProfileState._();

  const factory CandidateProfileState.initial() = _CandidateProfileState;
  const factory CandidateProfileState.load() = _CandidateProfileState;
}
