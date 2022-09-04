import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_edit_education_bloc.freezed.dart';
part 'candidate_edit_education_event.dart';
part 'candidate_edit_education_state.dart';

class CandidateEditEducationBloc
    extends Bloc<CandidateEditEducationEvent, CandidateEditEducationState> {
  CandidateEditEducationBloc({required this.candidateRepository})
      : super(const CandidateEditEducationIdle()) {
    on<CandidateEditEducationUpdated>(_onUpdated);
  }

  final CandidateRepository candidateRepository;

  _onUpdated(
    CandidateEditEducationUpdated event,
    Emitter emit,
  ) async {
    if (state is CandidateEditEducationLoading) return;
    emit(const CandidateEditEducationLoading());
    try {
      await candidateRepository.updateEducation(event.data);
      emit(const CandidateEditEducationSuccess());
    } catch (e) {
      emit(const CandidateEditEducationError());
    } finally {
      emit(const CandidateEditEducationIdle());
    }
  }
}
