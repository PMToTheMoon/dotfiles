import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_new_professional_experience_bloc.freezed.dart';
part 'candidate_new_professional_experience_event.dart';
part 'candidate_new_professional_experience_state.dart';

class CandidateNewProfessionalExperienceBloc extends Bloc<
    CandidateNewProfessionalExperienceEvent,
    CandidateNewProfessionalExperienceState> {
  CandidateNewProfessionalExperienceBloc({required this.candidateRepository})
      : super(const CandidateNewProfessionalExperienceIdle()) {
    on<CandidateNewProfessionalExperienceCreated>(_onCreated);
  }

  final CandidateRepository candidateRepository;

  _onCreated(CandidateNewProfessionalExperienceCreated event, Emitter emit) {
    if (state is CandidateNewProfessionalExperienceLoading) return;
    emit(const CandidateNewProfessionalExperienceLoading());
    try {
      candidateRepository.createProfessionalExperiences();
      emit(const CandidateNewProfessionalExperienceSuccess());
    } catch (e) {
      emit(const CandidateNewProfessionalExperienceError());
    }
  }
}
