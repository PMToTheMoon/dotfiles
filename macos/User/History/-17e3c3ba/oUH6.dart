part of 'flight_selection_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_name.freezed.dart';

@freezed
class FlightSelectionState with _$FlightSelectionState {
  const FlightSelectionState._();

  const factory FlightSelectionState.waitingNumberSubmission() = FlightSelectionWaitingNumberSubmission;
  const factory FlightSelectionState.submittingFlightNumber() = FlightSelectionSubmittingFlightNumber;
  const factory FlightSelectionState.success() = FlightSelectionSuccess;
  const factory FlightSelectionState.error() = FlightSelectionError;
}