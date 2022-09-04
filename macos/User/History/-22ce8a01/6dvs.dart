part of 'candidate_edit_professional_experience_bloc.dart';

@freezed
class CandidateEditProfessionalExperienceEvent
    with _$CandidateEditProfessionalExperienceEvent {
  const CandidateEditProfessionalExperienceEvent._();

  const factory CandidateEditProfessionalExperienceEvent.updated({
    required ProfessionalExperienceUpdate data,
  }) = CandidateEditProfessionalExperienceUpdated;
}
