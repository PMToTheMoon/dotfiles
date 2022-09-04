part of 'candidate_update_skills_bloc.dart';

@freezed
class CandidateUpdateSkillsState with _$CandidateUpdateSkillsState {
  const CandidateUpdateSkillsState._();

  const factory CandidateUpdateSkillsState.idle() = CandidateUpdateSkillsIdle;

  const factory CandidateUpdateSkillsState.loading() =
      CandidateUpdateSkillsLoading;

  const factory CandidateUpdateSkillsState.error() = CandidateUpdateSkillsError;

  const factory CandidateUpdateSkillsState.success() =
      CandidateUpdateSkillsSuccess;
}
