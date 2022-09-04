part of 'initial_observation_bloc.dart';

@freezed
class InitialObservationState with _$InitialObservationState {
  const InitialObservationState._();

  const factory InitialObservationState.sendData() = _InitialObservationState;
  const factory InitialObservationState.success() = _InitialObservationState;
  const factory InitialObservationState.error() = _InitialObservationState;
}
