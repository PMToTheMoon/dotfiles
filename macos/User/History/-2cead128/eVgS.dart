import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_observation_bloc.freezed.dart';
part 'initial_observation_event.dart';
part 'initial_observation_state.dart';

class InitialObservationBloc
    extends Bloc<InitialObservationEvent, InitialObservationState> {
  InitialObservationBloc() : super(const InitialObservationInitial()) {
    on<InitialObservationSubmitted>(_onInitialObservationSubmitted);
  }

  Future<void> _onInitialObservationSubmitted(
    InitialObservationSubmitted event,
    Emitter emit,
  ) async {}
}
