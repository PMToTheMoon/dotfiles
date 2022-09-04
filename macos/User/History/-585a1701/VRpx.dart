import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tech_by_tech/candidate/candidate_repository.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';
part 'candidate_bloc.freezed.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  CandidateBloc({
    required this.candidateRepository,
  }) : super(
          const CandidateState.initial(),
        ) {
    on<CandidateStarted>(_onCandidateStarted);
  }

  final CandidateRepository candidateRepository;

  Future<void> _onCandidateStarted(
      CandidateStarted event, Emitter emit) async {}
}
