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
    on<CandidateSkillListSkillDeleted>(_onStarted);
  }

  final CandidateRepository candidateRepository;

  _onStarted(CandidateSkillListStarted event, Emitter emit) {
    final sub = _subscribeToSkillsStream(emit);

    final skills = candidateRepository.skills;
    if (skills != null) {
      emit(state.copyWith(
        skills: skills,
        isLoading: false,
        error: null,
      ));
    } else {
      candidateRepository.fetchSkills();
    }

    return sub;
  }

  Future<void> _subscribeToSkillsStream(Emitter emit) {
    return emit.forEach(
      candidateRepository.skillsStream,
      onData: (Skills data) => state.copyWith(
        skills: data,
        isLoading: false,
        error: null,
      ),
      onError: (e, _) => state.copyWith(
        error: e,
      ),
    );
  }

  Future<void> _onSkillDeleted(
    CandidateSkillListSkillDeleted event,
    Emitter emit,
  ) async {
    Object? error;
    emit(state.copyWith(pendingDeletions: {
      ...state.pendingDeletions,
      event.skill,
    }));
    try {
      await candidateRepository.deleteSkills(event.skill);
    } catch (e) {
      emit(
        state.copyWith(
          pendingDeletions: Set.from(state.pendingDeletions)
            ..remove(event.skill),
          error: e,
        ),
      );
    }
  }
}
