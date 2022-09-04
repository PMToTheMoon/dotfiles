import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:models/models.dart';
import 'package:tech_by_tech/candidate/candidate_repository.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';
part 'candidate_bloc.freezed.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  CandidateBloc({
    required this.session,
    required this.candidateRepository,
  }) : super(
          const CandidateState.initial(),
        ) {
    on<CandidateStarted>(_onCandidateStarted);
  }

  final AuthSession session;
  final CandidateRepository candidateRepository;

  Future<void> _onCandidateStarted(CandidateStarted event, Emitter emit) async {
    if (state is CandidateLoading) return;
    emit(const CandidateLoading());
    try {
      final candidate = candidateRepository.candidate(session.userId);
      emit(const CandidateState.ready(candidate));
    } catch (e) {
      emit(const CandidateState.error());
    }
  }
}
