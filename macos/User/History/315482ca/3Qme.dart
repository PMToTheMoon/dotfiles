import 'dart:async';

import 'package:app_client/home/home.dart';
import 'package:app_client/user/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart';
import 'package:state_machine_bloc/state_machine_bloc.dart';

part 'trip_details_event.dart';
part 'trip_details_state.dart';
part 'trip_details_bloc.freezed.dart';

// TODO: put cancelation in a separate bloc
class TripDetailsBloc extends StateMachine<TripDetailsEvent, TripDetailsState> {
  TripDetailsBloc({
    required Trip trip,
    required this.userRepository,
    required this.reservationRepository,
  }) : super(
          TripDetailsState.initial(trip: trip),
        ) {
    define<TripDetailsState>(($) => $
      ..on<TripDetailsRefreshed>(_onTripRefreshed)
      // Initial
      ..define<TripDetailsInitial>(($) => $
        ..on<TripCancellationRequested>(
          _transitToCancellationInProgress,
        ))

      // Cancellation in progress
      ..define<TripCancellationInProgress>(($) => $
        ..onEnter(_cancelTransaction)
        ..on<TripCancellationAccepted>(_transitToCancellationAccepted)
        ..on<TripCancellationRefused>(_transitToCancellationRefused)
        ..on<TripCancellationUnexpectedError>(_transitToUnexpectedError))

      // Cancellation Success
      ..define<TripCancellationSuccess>(($) => $)

      // Cancellation Error
      ..define<TripCancellationError>(($) => $
        ..on<TripCancellationRequested>(
          _transitToCancellationInProgress,
        ))

      // Unexpected Error
      ..define<TripDetailsUnexpectedError>(($) => $));

    _tripsSubscription = userRepository.tripsStream.listen(_tripsStreamHandle);
  }

  final UserRepository userRepository;
  final ReservationRepository reservationRepository;
  late final StreamSubscription<List<Trip>> _tripsSubscription;

  @override
  Future<void> close() async {
    await _tripsSubscription.cancel();
    return super.close();
  }

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

  _tripsStreamHandle(List<Trip> trips) {
    final trip = trips.firstWhereOrNull((trip) => trip.id == state.trip.id);
    add(TripDetailsRefreshed(trip: trip));
  }

  TripDetailsState _onTripRefreshed(
    TripDetailsRefreshed event,
    TripDetailsState state,
  ) {
    final trip = event.trip;
    // if (trip != null) {
    //   return TripDetailsInitial(trip: trip.copyWith(comment: "prout"));
    // } else {
    return TripDetailsExit(trip: state.trip);
    // }
  }

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
