part of 'observations_bloc.dart';

@freezed
class ObservationsEvent with _$ObservationsEvent {
  const ObservationsEvent._();

  const factory ObservationsEvent.completeRecordRequested() =
      ObservationsCompleteRecordPressed;

  const factory ObservationsEvent.newObservationShared() =
      ObservationsNewObservationShared;
}
