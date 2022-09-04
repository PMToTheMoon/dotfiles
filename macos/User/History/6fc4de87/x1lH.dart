part of 'observations_bloc.dart';

@freezed
class ObservationsState with _$ObservationsState {
  const ObservationsState._();

  const factory ObservationsState.displayingObservations() = _ObservationsState;
  const factory ObservationsState.writingNewObservation() = _ObservationsState;
}
