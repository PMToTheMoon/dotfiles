part of 'candidate_professional_experiences_bloc.dart';

typedef ExperienceId = String;

@freezed
class CandidateProfessionalExperiencesState
    with _$CandidateProfessionalExperiencesState {
  const factory CandidateProfessionalExperiencesState({
    required List<ProfessionalExperience> experiences,
    required bool pendingCreate,
    required Set<ExperienceId> pendingDeletions,
    required Set<ExperienceId> pendingUpdates,
    required bool isLoading,
    required Object? error,
  }) = _CandidateProfessionalExperiencesState;

  factory CandidateProfessionalExperiencesState.initial() =>
      const CandidateProfessionalExperiencesState(
        experiences: [],
        pendingDeletions: {},
        pendingUpdates: {},
        pendingCreate: false,
        isLoading: true,
        error: null,
      );
}
