part of 'flight_selection_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_name.freezed.dart';

@freezed
class FlightSelectionState with _$FlightSelectionState {
  const FlightSelectionState._();

  const factory FlightSelectionState.waitingNumberSubmission() = _FlightSelectionState;
  const factory FlightSelectionState.flightSelectionSuccess() = _FlightSelectionState;
  const factory FlightSelectionState.flightSelectionSuccess() = _FlightSelectionState;
}