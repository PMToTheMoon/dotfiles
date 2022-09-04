import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_skill_list_bloc.freezed.dart';
part 'candidate_skill_list_event.dart';
part 'candidate_skill_list_state.dart';

class CandidateSkillListBloc
    extends Bloc<CandidateSkillListEvent, CandidateSkillListState> {
  CandidateSkillListBloc({required this.candidateRepository})
      : super(const CandidateSkillListInitial()) {
    on<CandidateSkillListStarted>(_onStarted);
  }

  final CandidateRepository candidateRepository;

  _onStarted(CandidateSkillListStarted event, Emitter emit) {
    if (state is CandidateSkillListLoading) return;
    emit(const CandidateSkillListLoading());
    try {
      candidateRepository.fetchSkillList();
      emit(const CandidateSkillListSuccess());
    } catch (e) {
      emit(const CandidateSkillListError());
    }
  }
}
