part of 'candidate_skill_list_bloc.dart';

@freezed
class CandidateSkillListEvent with _$CandidateSkillListEvent {
  const CandidateSkillListEvent._();

  const factory CandidateSkillListEvent.started() = CandidateSkillListStarted;

  const factory CandidateSkillListEvent.skillDeleted({
    required String skill,
  }) = CandidateSkillListSkillDeleted;
}
