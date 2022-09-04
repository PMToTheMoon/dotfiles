part of 'candidate_skill_list_bloc.dart';

@freezed
class CandidateSkillListState with _$CandidateSkillListState {
  const CandidateSkillListState._();

  const factory CandidateSkillListState({
    required Skills skills,
  }) = _CandidateSkillListInitial;

  const factory CandidateSkillListState.loading() = CandidateSkillListLoading;

  const factory CandidateSkillListState.error() = CandidateSkillListError;

  const factory CandidateSkillListState.success() = CandidateSkillListSuccess;
}
