import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_skill_list_bloc.freezed.dart';
part 'candidate_skill_list_event.dart';
part 'candidate_skill_list_state.dart';

class CandidateSkillListBloc
    extends Bloc<CandidateSkillListEvent, CandidateSkillListState> {
  CandidateSkillListBloc({required this.candidateRepository})
      : super(CandidateSkillListState.initial()) {
    on<CandidateSkillListStarted>(_onStarted);
  }

  final CandidateRepository candidateRepository;

  _onStarted(CandidateSkillListStarted event, Emitter emit) {
    final sub = emit.forEach(
      candidateRepository.skillsStream,
      onData: (Skills data) => CandidateSkillListState(
        skills: data,
        isLoading: false,
        error: null,
      ),
      onError: (e, _) => state.copyWith(
        error: e,
      ),
    );

    final skills = candidateRepository.skills;
    if (skills != null) {
      emit(CandidateSkillListState(
        skills: skills,
        isLoading: false,
        error: null,
      ));
    } else {
      // candidateRepository.fetchSkills();
    }
    return sub;
  }
}
