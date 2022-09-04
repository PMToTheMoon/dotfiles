part of 'candidate_new_professional_experience_bloc.dart';

@freezed
class CandidateNewProfessionalExperienceState
    with _$CandidateNewProfessionalExperienceState {
  const CandidateNewProfessionalExperienceState._();

  const factory CandidateNewProfessionalExperienceState.idle() =
      CandidateNewProfessionalExperienceIdle;

  const factory CandidateNewProfessionalExperienceState.loading() =
      CandidateNewProfessionalExperienceLoading;

  const factory CandidateNewProfessionalExperienceState.error() =
      CandidateNewProfessionalExperienceError;

  const factory CandidateNewProfessionalExperienceState.success() =
      CandidateNewProfessionalExperienceSuccess;
}
