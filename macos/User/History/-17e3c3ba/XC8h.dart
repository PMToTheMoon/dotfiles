part of 'flight_selection_bloc.dart';

@freezed
class FlightSelectionState with _$FlightSelectionState {
  const FlightSelectionState._();

  const factory FlightSelectionState.waitingSubmission() =
      FlightSelectionWaitingSubmission;

  const factory FlightSelectionState.submittingFlightNumber({
    required String flightNumber,
    required DateTime date,
  }) = FlightSelectionSubmittingFlightNumber;

  const factory FlightSelectionState.success({
    required FlightData data,
  }) = FlightSelectionSuccess;

  const factory FlightSelectionState.error() = FlightSelectionError;
}
