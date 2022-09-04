part of 'flight_selection_bloc.dart';

@freezed
class FlightSelectionEvent with _$FlightSelectionEvent {
  const FlightSelectionEvent._();

  const factory FlightSelectionEvent.flightNumberSubmitted() =
      _FlightSelectionSubmitted;
  const factory FlightSelectionEvent.flightDataReceived() =
      FlightSelectionDataReceived;
}
