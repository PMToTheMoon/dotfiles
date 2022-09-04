import 'package:app_client/home/home.dart';
import 'package:app_client/trip_details/trip_details.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';

part 'trip_details_event.dart';
part 'trip_details_state.dart';
part 'trip_details_bloc.freezed.dart';

class TripDetailsBloc extends StateMachine<TripDetailsEvent, TripDetailsState> {
  TripDetailsBloc({
    required Trip trip,
    required this.reservationRepository,
  }) : super(
          TripDetailsState.initial(trip: trip),
        ) {
    define<TripDetailsState>(($) => $
      ..define<TripDetailsInitial>(($) => $
        ..on<TripCancellationRequested>(
          _transitToCancellationInProgress,
        ))
      ..define<TripCancellationInProgress>(($) => $
        ..onEnter(_cancelTransaction)
        ..on<TripCancellationAccepted>(_transitToCancellationAccepted)
        ..on<TripCancellationRefused>(_transitToCancellationRefused)
        ..on<TripCancellationUnexpectedError>(_transitToUnexpectedError))
      ..define<TripCancellationSuccess>(($) => $)
      //Error
      ..define<TripCancellationError>(($) => $
        ..on<TripCancellationRequested>(
          _transitToCancellationInProgress,
        ))
      ..define<TripDetailsUnexpectedError>(($) => $));
  }

  final ReservationRepository reservationRepository;

  TripCancellationInProgress _transitToCancellationInProgress(
    e,
    TripDetailsState s,
  ) =>
      TripCancellationInProgress(trip: s.trip);

  TripCancellationSuccess _transitToCancellationAccepted(
    e,
    TripDetailsState s,
  ) =>
      TripCancellationSuccess(trip: s.trip);

  TripCancellationError _transitToCancellationRefused(
    TripCancellationRefused e,
    TripDetailsState s,
  ) =>
      TripCancellationError(
        trip: s.trip,
        error: e.error,
      );

  TripDetailsUnexpectedError _transitToUnexpectedError(
    e,
    TripDetailsState s,
  ) =>
      TripDetailsUnexpectedError(trip: s.trip);

  _cancelTransaction(TripCancellationInProgress state) async {
    try {
      await reservationRepository.cancelTransaction(state.trip.id);
      add(const TripCancellationAccepted());
    } on CancellationRefused catch (e) {
      add(TripCancellationRefused(error: e.message));
    } catch (e) {
      add(const TripDetailsEvent.tripCancellationUnexpectedError());
    }
  }
}
