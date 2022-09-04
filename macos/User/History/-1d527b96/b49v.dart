part of 'initial_observation_bloc.dart';

@freezed
class InitialObservationEvent with _$InitialObservationEvent {
  const InitialObservationEvent._();

  const factory InitialObservationEvent.submitted(
      // dossier to send
      ) = InitialObservationSubmitted;
}
