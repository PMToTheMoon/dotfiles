part of 'candidate_new_education_bloc.dart';

@freezed
class CandidateNewProfessionalExperienceEvent
    with _$CandidateNewProfessionalExperienceEvent {
  const CandidateNewProfessionalExperienceEvent._();

  const factory CandidateNewProfessionalExperienceEvent.created({
    required NewProfessionalExperience data,
  }) = CandidateNewProfessionalExperienceCreated;
}
