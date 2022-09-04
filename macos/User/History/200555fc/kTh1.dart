part of 'candidate_profile_bloc.dart';

@freezed
class CandidateProfileState with _$CandidateProfileState {
  const CandidateProfileState._();

  const factory CandidateProfileState.initial() = CandidateProfileInitial;
  const factory CandidateProfileState.loading() = CandidateProfileLoading;
  const factory CandidateProfileState.success() = CandidateProfileSuccess;
  const factory CandidateProfileState.error() = CandidateProfileError;
}
