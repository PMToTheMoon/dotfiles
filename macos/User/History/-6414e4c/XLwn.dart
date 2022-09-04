import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_new_education_bloc.freezed.dart';
part 'candidate_new_education_event.dart';
part 'candidate_new_education_state.dart';

class CandidateNewEductaionBloc
    extends Bloc<CandidateNewEductaionEvent, CandidateNewEductaionState> {
  CandidateNewEductaionBloc({required this.candidateRepository})
      : super(const CandidateNewEductaionIdle()) {
    on<CandidateNewEductaionCreated>(_onCreated);
  }

  final CandidateRepository candidateRepository;

  _onCreated(
    CandidateNewEductaionCreated event,
    Emitter emit,
  ) async {
    if (state is CandidateNewEductaionLoading) return;
    emit(const CandidateNewEductaionLoading());
    try {
      await candidateRepository.createEductaion(event.data);
      emit(const CandidateNewEductaionSuccess());
    } catch (e) {
      emit(const CandidateNewEductaionError());
    } finally {
      emit(const CandidateNewEductaionIdle());
    }
  }
}
