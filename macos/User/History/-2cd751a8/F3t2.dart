part of 'candidate_professional_experiences_bloc.dart';

typedef ExperienceId = String;

@freezed
class CandidateProfessionalExperiencesState
    with _$CandidateProfessionalExperiencesState {
  const factory CandidateProfessionalExperiencesState({
    required List<ProfessionalExperience> experiences,
    required Set<ExperienceId> pendingDeletions,
    required Set<ExperienceId> pendingUpdates,
    required bool isLoading,
    required Object? error,
  }) = _CandidateProfessionalExperiencesState;

  CandidateProfessionalExperiencesState.initial()
      : experiences = [],
        pendingDeletions = [],
        pendingUpdates = [],
        isLoading = true,
        error = null;
}
