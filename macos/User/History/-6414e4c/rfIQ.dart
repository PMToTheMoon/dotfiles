import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_new_education_bloc.freezed.dart';
part 'candidate_new_education_event.dart';
part 'candidate_new_education_state.dart';

class CandidateNewEducationBloc
    extends Bloc<CandidateNewEducationEvent, CandidateNewEducationState> {
  CandidateNewEducationBloc({required this.candidateRepository})
      : super(const CandidateNewEducationIdle()) {
    on<CandidateNewEducationCreated>(_onCreated);
  }

  final CandidateRepository candidateRepository;

  _onCreated(
    CandidateNewEducationCreated event,
    Emitter emit,
  ) async {
    if (state is CandidateNewEducationLoading) return;
    emit(const CandidateNewEducationLoading());
    try {
      await candidateRepository.createEducation(event.data);
      emit(const CandidateNewEducationSuccess());
    } catch (e) {
      emit(const CandidateNewEducationError());
    } finally {
      emit(const CandidateNewEducationIdle());
    }
  }
}
