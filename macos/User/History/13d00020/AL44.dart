import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/candidate/candidate.dart';
import 'package:models/models.dart';

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

  Future<void> _onUpdated(
      CandidateUpdateSkillsUpdated event, Emitter emit) async {
    if (state is CandidateUpdateSkillsLoading) return;
    emit(const CandidateUpdateSkillsLoading());
    try {
      await candidateRepository.setSkills(event.update);
      emit(const CandidateUpdateSkillsSuccess());
    } catch (e) {
      emit(const CandidateUpdateSkillsError());
    } finally {
      emit(const CandidateUpdateSkillsIdle());
    }
  }
}
