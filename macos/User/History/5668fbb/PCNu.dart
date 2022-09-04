part of 'candidate_skill_list_bloc.dart';

@freezed
class CandidateSkillListState with _$CandidateSkillListState {
  const CandidateSkillListState._();

  const factory CandidateSkillListState({
    required Skills skills,
    bool isLoading,
    Object? error,
  }) = _CandidateSkillListInitial;
}
