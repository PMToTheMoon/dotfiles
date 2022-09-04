part of 'candidate_edit_professional_experience_bloc.dart';

@freezed
class CandidateEditProfessionalExperienceState
    with _$CandidateEditProfessionalExperienceState {
  const CandidateEditProfessionalExperienceState._();

  const factory CandidateEditProfessionalExperienceState.idle() =
      CandidateEditProfessionalExperienceIdle;

  const factory CandidateEditProfessionalExperienceState.loading() =
      CandidateEditProfessionalExperienceLoading;

  const factory CandidateEditProfessionalExperienceState.error() =
      CandidateEditProfessionalExperienceError;

  const factory CandidateEditProfessionalExperienceState.success() =
      CandidateEditProfessionalExperienceSuccess;
}
