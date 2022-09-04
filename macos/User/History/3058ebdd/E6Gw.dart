part of 'flight_selection_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_name.freezed.dart';

@freezed
class FlightSelectionEvent with _$FlightSelectionEvent {
  const FlightSelectionEvent._();

  const factory FlightSelectionEvent.flightNumberSubmitted() = _FlightSelectionEvent;
  const factory FlightSelectionEvent.flightDataReceived() = _FlightSelectionEvent;
}
