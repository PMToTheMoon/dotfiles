part of 'flight_selection_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_name.freezed.dart';

@freezed
class FlightSelectionEvent with _$FlightSelectionEvent {
  const FlightSelectionEvent._();

  const factory FlightSelectionEvent.flightNumberSubmitted() = _FlightSelectionSubmitted;
  const factory FlightSelectionEvent.flightDataReceived() = FlightSelectionDataReceived;
}
