part of 'candidate_profile_bloc.dart';

@freezed
class CandidateProfileState with _$CandidateProfileState {
  const CandidateProfileState._();

  const factory CandidateProfileState.initial() = _CandidateProfileState;
  const factory CandidateProfileState.loading() = _CandidateProfileState;
  const factory CandidateProfileState.success() = _CandidateProfileState;
  const factory CandidateProfileState.error() = _CandidateProfileState;
}
