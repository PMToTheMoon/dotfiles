part of 'initial_observation_bloc.dart';

@freezed
class InitialObservationState with _$InitialObservationState {
  const InitialObservationState._();

  const factory InitialObservationState.sendData() =
      _InitialObservationSendData;
  const factory InitialObservationState.success() = _InitialObservationSuccess;
  const factory InitialObservationState.error() = _InitialObservationError;
}
