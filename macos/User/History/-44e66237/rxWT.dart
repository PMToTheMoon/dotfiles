import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

part 'candidate_edit_education_bloc.freezed.dart';
part 'candidate_edit_education_event.dart';
part 'candidate_edit_education_state.dart';

class CandidateEditEductaionBloc
    extends Bloc<CandidateEditEductaionEvent, CandidateEditEductaionState> {
  CandidateEditEductaionBloc({required this.candidateRepository})
      : super(const CandidateEditEductaionIdle()) {
    on<CandidateEditEductaionUpdated>(_onCreated);
  }

  final CandidateRepository candidateRepository;

  _onCreated(
    CandidateEditEductaionUpdated event,
    Emitter emit,
  ) async {
    if (state is CandidateEditEductaionLoading) return;
    emit(const CandidateEditEductaionLoading());
    try {
      await candidateRepository.updateEductaion(event.data);
      emit(const CandidateEditEductaionSuccess());
    } catch (e) {
      emit(const CandidateEditEductaionError());
    } finally {
      emit(const CandidateEditEductaionIdle());
    }
  }
}
