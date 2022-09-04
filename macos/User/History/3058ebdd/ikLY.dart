part of 'flight_selection_bloc.dart';

@freezed
class FlightSelectionEvent with _$FlightSelectionEvent {
  const FlightSelectionEvent._();

  const factory FlightSelectionEvent.formDataChanged() =
      FlightSelectionFormDataChanged;

  const factory FlightSelectionEvent.flightNumberSubmitted({
    required String flightNumber,
    required DateTime date,
  }) = FlightSelectionSubmitted;

  const factory FlightSelectionEvent.flightFound({
    required FlightData data,
  }) = FlightSelectionFlightFound;
  const factory FlightSelectionEvent.flightNotFound() =
      FlightSelectionFlightNotFound;
}
