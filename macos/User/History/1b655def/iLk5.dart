part of 'candidate_professional_experiences_bloc.dart';

@freezed
class CandidateProfessionalExperiencesEvent
    with _$CandidateProfessionalExperiencesEvent {
  const CandidateProfessionalExperiencesEvent._();

  const factory CandidateProfessionalExperiencesEvent.started() =
      CandidateProfessionalExperiencesStarted;

  const factory CandidateProfessionalExperiencesEvent.updated({
    required ProfessionalExperienceUpdate update,
  }) = CandidateProfessionalExperiencesUpdated;

  const factory CandidateProfessionalExperiencesEvent.deleted({
    required String id,
  }) = CandidateProfessionalExperiencesDeleted;
}
