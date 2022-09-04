part of 'candidate_new_professional_experience_bloc.dart';

@freezed
class CandidateNewProfessionalExperienceEvent
    with _$CandidateNewProfessionalExperienceEvent {
  const CandidateNewProfessionalExperienceEvent._();

  const factory CandidateNewProfessionalExperienceEvent.created() =
      CandidateNewProfessionalExperienceCreated;
}
