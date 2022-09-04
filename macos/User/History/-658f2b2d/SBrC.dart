part of 'initial_observation_bloc.dart';

@freezed
class InitialObservationState with _$InitialObservationState {
  const InitialObservationState._();

  const factory InitialObservationState.post() = InitialObservationPost;
  const factory InitialObservationState.success() = InitialObservationSuccess;
  const factory InitialObservationState.error() = InitialObservationError;
}
