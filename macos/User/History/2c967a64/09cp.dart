part of 'candidate_educations_bloc.dart';

typedef ExperienceId = String;

@freezed
class CandidateEducationsState with _$CandidateEducationsState {
  const factory CandidateEducationsState({
    required List<Eductaion> experiences,
    required Set<ExperienceId> pendingDeletions,
    required Set<ExperienceId> pendingUpdates,
    required bool isLoading,
    required Object? error,
  }) = _CandidateEducationsState;

  factory CandidateEducationsState.initial() => const CandidateEducationsState(
        experiences: [],
        pendingDeletions: {},
        pendingUpdates: {},
        isLoading: true,
        error: null,
      );
}
