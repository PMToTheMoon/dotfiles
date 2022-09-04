import 'dart:async';

import 'package:app_client/address_selection/address_selection.dart';
import 'package:app_client/user/user.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:common/common.dart' hide ReservationStatus;
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app_client/reservation/reservation.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';
part 'reservation_bloc.freezed.dart';

const kReservationMinuteIntervale = 5;

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc({
    required this.userRepository,
    required this.reservationRepository,
    Address? initialDeparture,
    Address? initialArrival,
  }) : super(ReservationState(
          status: ReservationStateStatus.loading,
          vehicle: Vehicle.motorcycle,
          departure: initialDeparture,
          arrival: initialArrival,
        )) {
    on<ReservationInitialized>(_onInitialized);
    on<ReservationVehicleSelected>(_onVehicleSelected);
    on<ReservationDateSelected>(_onDateSelected);
    on<ReservationAddressesSelected>(_onAddressesSelected);
    on<ReservationUserChanged>(_onUserChanged);
    on<ReservationFormCompleted>(
      _onReservationFormCompleted,
      transformer: restartable(),
    );
    on<ReservationPayCommandButtonPressed>(_onPayCommandButtonPressed);
    on<ReservationPaymentFailed>(_onPaymentFailed);
    on<ReservationCompleted>(
      _onReservationCompleted,
      transformer: restartable(),
    );
    _userSubscription = userRepository.userStream.listen(
      (_) => add(const ReservationUserChanged()),
    );

    _init();
  }

  final UserRepository userRepository;
  final ReservationRepository reservationRepository;
  late StreamSubscription<User?> _userSubscription;

  Future<void> _init() async {
    final user = userRepository.user;
    if (user == null) return;
    return add(ReservationEvent.initialized(
      userInfos: user.infos,
      passenger: user.defaultPassenger,
      paymentMethod: user.defaultPaymentMethod,
      date: DateTime.now().roundMinute(kReservationMinuteIntervale),
      currentReservation: await reservationRepository.currentReservation(),
    ));
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  void _onInitialized(
    ReservationInitialized event,
    Emitter<ReservationState> emit,
  ) {
    final status = event.currentReservation != null
        ? ReservationStateStatus.paymentNeeded
        : ReservationStateStatus.editing;
    emit(state.copyWith(
      status: status,
      userInfos: event.userInfos,
      passenger: event.passenger,
      paymentMethod: event.paymentMethod,
      reservation: event.currentReservation,
    ));
  }

  void _onVehicleSelected(
    ReservationVehicleSelected event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(
      status: ReservationStateStatus.editing,
      vehicle: event.vehicle,
    ));
  }

  void _onDateSelected(
    ReservationDateSelected event,
    Emitter<ReservationState> emit,
  ) {
    emit(state.copyWith(
      status: ReservationStateStatus.editing,
      date: event.date,
    ));
  }

  void _onAddressesSelected(
    ReservationAddressesSelected event,
    Emitter<ReservationState> emit,
  ) {
    final result = event.value;
    ReservationState newState = state.copyWith(
      status: ReservationStateStatus.editing,
    );
    if (result.departureChanged) {
      newState = newState.copyWith(
        departure: result.departureAddress,
        trainNumber: result.departureTrainNumber,
        flightNumber: result.departureFlightNumber,
        departureDelay: result.departureDelay,
        date: result.departureDate ?? state.date,
      );
    }
    if (result.arrivalChanged) {
      newState = newState.copyWith(
        arrival: result.arrivalAddress,
      );
    }
    emit(newState);
  }

  Future<void> _onUserChanged(
    ReservationUserChanged event,
    Emitter<ReservationState> emit,
  ) async {
    emit(state.copyWith(
      status: ReservationStateStatus.editing,
      paymentMethod: userRepository.defaultPaymentMethod,
      passenger: userRepository.defaultPassenger,
    ));
  }

  Future<void> _onReservationFormCompleted(
    ReservationFormCompleted event,
    Emitter<ReservationState> emit,
  ) async {
    emit(state.copyWith(status: ReservationStateStatus.estimationRequested));

    final userID = state.userInfos?.userID;
    final request = state.reservationRequest;
    if (userID == null || request == null) throw InvalidState();

    try {
      final estimate = await reservationRepository.getReservationEstimate(
        userID,
        request,
      );
      emit(state.copyWith(
        status: ReservationStateStatus.estimationReceived,
        estimate: estimate,
        reservation: request.estimate(estimate),
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReservationStateStatus.reservationError,
      ));
      reservationRepository.clearReservation();
      emit(ReservationState(
        vehicle: Vehicle.motorcycle,
        status: ReservationStateStatus.editing,
        userInfos: state.userInfos,
        passenger: state.passenger,
        paymentMethod: state.paymentMethod,
      ));
    }
  }

  Future<void> _onPayCommandButtonPressed(
    ReservationPayCommandButtonPressed event,
    Emitter emit,
  ) async {
    emit(state.copyWith(status: ReservationStateStatus.commandPassed));

    final userID = state.userInfos?.userID;
    final reservation = state.reservation;
    if (userID == null || reservation is! EstimatedReservation) {
      throw InvalidState();
    }

    try {
      final validatedReservation =
          await reservationRepository.validateReservation(
        userID: userID,
        reservation: reservation,
        comment: event.comment,
      );
      emit(state.copyWith(
        status: ReservationStateStatus.paymentNeeded,
        reservation: validatedReservation,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ReservationStateStatus.reservationError,
      ));
      emit(state.copyWith(
        status: ReservationStateStatus.estimationReceived,
      ));
    }
  }

  void _onPaymentFailed(
    ReservationPaymentFailed event,
    Emitter emit,
  ) {
    reservationRepository.clearReservation();
    final reservation = state.reservation;
    if (reservation is! ValidatedReservation) throw InvalidState();
    emit(state.copyWith(
      status: ReservationStateStatus.estimationReceived,
      reservation: reservation.unvalidate(),
    ));
  }

  void _onReservationCompleted(_, Emitter emit) {
    reservationRepository.clearReservation();
    emit(ReservationState(
      vehicle: Vehicle.motorcycle,
      status: ReservationStateStatus.editing,
      userInfos: state.userInfos,
      passenger: state.passenger,
      paymentMethod: state.paymentMethod,
    ));
  }

  @override
  void onChange(Change<ReservationState> change) {
    super.onChange(change);
    final _state = change.nextState;
    if (_state.status == ReservationStateStatus.editing && _state.isValid) {
      add(const ReservationFormCompleted());
    }
  }
}
