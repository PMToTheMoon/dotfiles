part of 'candidate_skill_list_bloc.dart';

@freezed
class CandidateSkillListState with _$CandidateSkillListState {
  const CandidateSkillListState._();

  const factory CandidateSkillListState({
    required Skills skills,
    required Skills pendingDeletions,
    required bool isLoading,
    required Object? error,
  }) = _CandidateSkillListState;

  factory CandidateSkillListState.initial() => const CandidateSkillListState(
        skills: {},
        pendingDeletions: {},
        isLoading: true,
        error: null,
      );
}
