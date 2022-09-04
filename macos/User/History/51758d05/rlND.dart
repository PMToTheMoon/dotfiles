import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart';

part 'flight_selection_bloc.freezed.dart';
part 'flight_selection_event.dart';
part 'flight_selection_state.dart';

class FlightSelectionBloc
    extends StateMachine<FlightSelectionEvent, FlightSelectionState> {
  FlightSelectionBloc()
      : super(
          const FlightSelectionWaitingNumberSubmission(),
        ) {
    define<FlightSelectionState>(($) => $
      ..on<FlightSelectionFormDataChanged>(_toWaitingSubmission)
      ..define<FlightSelectionWaitingSubmission>(
          ($) => $..on<FlightSelectionSubmitted>(_toSubmitting))
      ..define<FlightSelectionSubmittingFlightNumber>(($) => $
        ..onEnter(_submit)
        ..on<FlightSelectionDataReceived>(_toSuccessOrError))
      ..define<FlightSelectionSuccess>()
      ..define<FlightSelectionError>());
  }

  FlightSelectionWaitingSubmission _toWaitingSubmission(e, s) =>
      const FlightSelectionWaitingSubmission();

  FlightSelectionWaitingSubmission _toSubmitting(e, s) =>
      const FlightSelectionWaitingSubmission();
}
