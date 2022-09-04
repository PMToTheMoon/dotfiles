part of 'candidate_educations_bloc.dart';

typedef EducationId = String;

@freezed
class CandidateEducationsState with _$CandidateEducationsState {
  const factory CandidateEducationsState({
    required List<Education> educations,
    required List<int> insertedItems,
    required List<int> removedItems,
    required Set<EducationId> pendingDeletions,
    required Set<EducationId> pendingUpdates,
    required bool isLoading,
    required Object? error,
  }) = _CandidateEducationsState;

  factory CandidateEducationsState.initial() => const CandidateEducationsState(
        educations: [],
        pendingDeletions: {},
        pendingUpdates: {},
        isLoading: true,
        error: null,
      );
}
