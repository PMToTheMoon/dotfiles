import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_update_skills_bloc.freezed.dart';
part 'candidate_update_skills_event.dart';
part 'candidate_update_skills_state.dart';

class CandidateUpdateSkillsBloc
    extends Bloc<CandidateUpdateSkillsEvent, CandidateUpdateSkillsState> {
  CandidateUpdateSkillsBloc({required this.candidateRepository})
      : super(const CandidateUpdateSkillsIdle()) {
    on<CandidateUpdateSkillsUpdated>(_onUpdated);
  }

  final CandidateRepository candidateRepository;

  _onUpdated(CandidateUpdateSkillsUpdated event, Emitter emit) {
    if (state is CandidateUpdateSkillsLoading) return;
    emit(const CandidateUpdateSkillsLoading());
    try {
      candidateRepository.setSkills({
        ...?candidateRepository.skills,
        ...event.update,
      });
      emit(const CandidateUpdateSkillsSuccess());
    } catch (e) {
      emit(const CandidateUpdateSkillsError());
    }
  }
}
