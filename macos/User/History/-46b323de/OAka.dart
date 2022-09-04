part of 'candidate_update_skills_bloc.dart';

@freezed
class CandidateUpdateSkillsEvent with _$CandidateUpdateSkillsEvent {
  const CandidateUpdateSkillsEvent._();

  const factory CandidateUpdateSkillsEvent.updated() =
      CandidateUpdateSkillsUpdated;
}
