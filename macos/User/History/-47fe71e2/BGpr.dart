part of 'observations_bloc.dart';

@freezed
class ObservationsBlocEvent with _$ObservationsBlocEvent {
  const ObservationsBlocEvent._();

  const factory ObservationsBlocEvent.completeRecordRequested() =
      _ObservationsBlocEvent;
}
