part of 'candidate_professional_experiences_bloc.dart';

typedef ExperienceId = String;

@freezed
class CandidateProfessionalExperiencesState
    with _$CandidateProfessionalExperiencesState {
  const CandidateProfessionalExperiencesState._();

  const factory CandidateProfessionalExperiencesState.initial() =
      CandidateProfessionalExperiencesInitial;

  const factory CandidateProfessionalExperiencesState.loading(
          {List<ProfessionalExperience>? data}) =
      CandidateProfessionalExperiencesLoading;

  const factory CandidateProfessionalExperiencesState.error({
    Object? error,
  }) = CandidateProfessionalExperiencesError;

  const factory CandidateProfessionalExperiencesState({
    required List<ProfessionalExperience> experiences,
    required Set<ExperienceId> pendingDeletions,
    required Set<ExperienceId> pendingUpdates,
  }) = CandidateProfessionalExperiencesState;
}
