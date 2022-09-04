import 'package:app_client/home/home.dart';
import 'package:app_client/user/user.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart';

part 'flight_selection_bloc.freezed.dart';
part 'flight_selection_event.dart';
part 'flight_selection_state.dart';

class FlightSelectionBloc
    extends StateMachine<FlightSelectionEvent, FlightSelectionState> {
  FlightSelectionBloc({
    required this.reservationRepository,
  }) : super(
          const FlightSelectionWaitingSubmission(),
        ) {
    //wait inputs ready
    define<FlightSelectionWaitingSubmission>(
        ($) => $..on<FlightSelectionFormDataChanged>(_onDataChanged));

    //submit form
    define<FlightSelectionSubmittingFlightNumber>(($) => $
      ..onEnter(_submit)
      ..on<FlightSelectionFlightFound>(_toSuccess)
      ..on<FlightSelectionFlightNotFound>(_toError));

    //flight found
    define<FlightSelectionSuccess>(
        ($) => $..on<FlightSelectionFormDataChanged>(_onDataChanged));

    //flight not found
    define<FlightSelectionError>(
        ($) => $..on<FlightSelectionFormDataChanged>(_onDataChanged));
  }

  final UserRepository userRepository;
  final ReservationRepository reservationRepository;

  FlightSelectionState? _onDataChanged(FlightSelectionFormDataChanged e, s) {
    final date = e.date;
    final flightNumber = e.flightNumber;
    if (date != null && flightNumber != null) {
      return FlightSelectionSubmittingFlightNumber(
        date: date,
        flightNumber: flightNumber,
      );
    }
    return const FlightSelectionWaitingSubmission();
  }

  FlightSelectionState _toSuccess(FlightSelectionFlightFound e, s) =>
      FlightSelectionSuccess(data: e.data);

  FlightSelectionState _toError(e, s) => const FlightSelectionError();

  void _submit(FlightSelectionSubmittingFlightNumber state) async {
    try {
      final data = await reservationRepository.flightData(
        state.flightNumber,
        state.date,
      );
      final airport = userRepository.favoriteAddresses?.firstWhereOrNull(
        (a) => a.id == data.airportID,
      );
      add(FlightSelectionEvent.flightFound(data: data));
    } catch (e) {
      add(const FlightSelectionEvent.flightNotFound());
    }
  }
}
