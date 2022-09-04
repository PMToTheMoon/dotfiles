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
  ) async {
    if (state is InitialObservationPost) return;
    emit(const InitialObservationPost());
    try {
      await Future.delayed(const Duration(seconds: 3));
      throw 'yeyye';
      emit(const InitialObservationSuccess());
    } catch (e) {
      emit(const InitialObservationError());
    }
  }
}
