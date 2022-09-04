import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'candidate_event.dart';
part 'candidate_state.dart';
part 'candidate_bloc.freezed.dart';

class CandidateBloc extends Bloc<CandidateEvent, CandidateState> {
  CandidateBloc()
      : super(
          const CandidateState.initial(),
        ) {
    on<CandidateStarted>(_onCandidateStarted);
  }

  Future<void> _onCandidateStarted(CandidateStarted event, Emitter emit);
}
