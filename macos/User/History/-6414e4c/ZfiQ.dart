import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_new_education_bloc.freezed.dart';
part 'candidate_new_education_event.dart';
part 'candidate_new_education_state.dart';

class CandidateNewProfessionalExperienceBloc extends Bloc<
    CandidateNewProfessionalExperienceEvent,
    CandidateNewProfessionalExperienceState> {
  CandidateNewProfessionalExperienceBloc({required this.candidateRepository})
      : super(const CandidateNewProfessionalExperienceIdle()) {
    on<CandidateNewProfessionalExperienceCreated>(_onCreated);
  }

  final CandidateRepository candidateRepository;

  _onCreated(
    CandidateNewProfessionalExperienceCreated event,
    Emitter emit,
  ) async {
    if (state is CandidateNewProfessionalExperienceLoading) return;
    emit(const CandidateNewProfessionalExperienceLoading());
    try {
      await candidateRepository.createProfessionalExperience(event.data);
      emit(const CandidateNewProfessionalExperienceSuccess());
    } catch (e) {
      emit(const CandidateNewProfessionalExperienceError());
    } finally {
      emit(const CandidateNewProfessionalExperienceIdle());
    }
  }
}
