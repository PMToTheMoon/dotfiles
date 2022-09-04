import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_edit_education_bloc.freezed.dart';
part 'candidate_edit_education_event.dart';
part 'candidate_edit_education_state.dart';

class CandidateEditProfessionalExperienceBloc extends Bloc<
    CandidateEditProfessionalExperienceEvent,
    CandidateEditProfessionalExperienceState> {
  CandidateEditProfessionalExperienceBloc({required this.candidateRepository})
      : super(const CandidateEditProfessionalExperienceIdle()) {
    on<CandidateEditProfessionalExperienceUpdated>(_onCreated);
  }

  final CandidateRepository candidateRepository;

  _onCreated(
    CandidateEditProfessionalExperienceUpdated event,
    Emitter emit,
  ) async {
    if (state is CandidateEditProfessionalExperienceLoading) return;
    emit(const CandidateEditProfessionalExperienceLoading());
    try {
      await candidateRepository.updateProfessionalExperience(event.data);
      emit(const CandidateEditProfessionalExperienceSuccess());
    } catch (e) {
      emit(const CandidateEditProfessionalExperienceError());
    } finally {
      emit(const CandidateEditProfessionalExperienceIdle());
    }
  }
}
