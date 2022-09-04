import 'package:app_client/auth/auth.dart';
import 'package:app_client/trip_list/trip_list.dart';
import 'package:app_client/user/user.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:common/common.dart' hide ReservationStatus;
import 'package:app_client/navigation_menu/navigation_menu.dart';
import 'package:app_client/payment/payment.dart';
import 'package:app_client/home/home.dart';
import 'package:app_client/map/map.dart';
import 'package:neat/neat.dart';

part '_drive_alert.dart';

class HomePageArguments {
  const HomePageArguments({
    this.departure,
    this.arrival,
    this.flightNumber,
    this.date,
    this.trainNumber,
    this.departureDelay = 0,
  });

  const HomePageArguments.noArguments()
      : departure = null,
        arrival = null,
        flightNumber = null,
        date = null,
        trainNumber = null,
        departureDelay = 0;

  final Address? departure;
  final Address? arrival;
  final String? flightNumber;
  final DateTime? date;
  final String? trainNumber;
  final int departureDelay;
}

class HomePage extends StatelessWidget {
  static const String route = "/home";

  static Widget builder(BuildContext context) {
    try {
      final args =
          ModalRoute.of(context)!.settings.arguments as HomePageArguments?;
      return HomePage(
        arguments: args ?? const HomePageArguments.noArguments(),
      );
    } catch (_) {
      throw InvalidPageArguments<HomePage>();
    }
  }

  static Future<void> open(
    BuildContext context,
    HomePageArguments arguments,
  ) async =>
      Navigator.of(context).pushNamed(
        route,
        arguments: arguments,
      );

  static void goBack(BuildContext context) => Navigator.of(context).pop();

  const HomePage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final HomePageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationBloc(
        reservationRepository: context.read(),
        userRepository: context.read(),
        initialDeparture: arguments.departure,
        initialArrival: arguments.arrival,
        initialDate: arguments.date,
        initialDepartureDelay: arguments.departureDelay,
        initialFlightNumber: arguments.flightNumber,
        initialTrainNumber: arguments.trainNumber,
      ),
      child: _HomePage(
        departureInitialValue: arguments.departure?.label,
        arrivalInitialValue: arguments.arrival?.label,
      ),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage({
    this.departureInitialValue,
    this.arrivalInitialValue,
    Key? key,
  }) : super(key: key);

  final String? departureInitialValue;
  final String? arrivalInitialValue;

  Future<void> _onReservationConfirmed(
    BuildContext context,
    ReservationState state,
  ) async {
    final reservation = state.reservation;
    if (reservation is! ValidatedReservation) throw InvalidState();
    final paymentResult = await PaymentPage.open(
      context,
      PaymentPageArguments(transactionID: reservation.transactionID),
    );
    if (paymentResult.success) {
      context
          .read<ReservationBloc>()
          .add(const ReservationEvent.reservationCompleted());
      await showDialog(
        context: context,
        builder: (c) => SuccessDialog(
          title: context.l10n.payment_successful_dialog_title,
        ),
      );
    } else {
      context
          .read<ReservationBloc>()
          .add(const ReservationEvent.paymentFailed());
      await showDialog(
        context: context,
        builder: (c) => ErrorDialog(
          title: context.l10n.payment_error_dialog_title,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final trips = context.select((UserBloc bloc) => bloc.user.trips);
    final incomingTripNumber =
        trips.where((element) => element.date.isAfter(now)).length;

    return Page.noScroll(
      resizeToAvoidBottomInset: false,
      drawer: const NavigationMenu(),
      padding: const Padding3(left | right | bottom),
      appBar: logoAppBar(
        context,
        actions: [
          Center(
            child: Padding(
              padding: const Padding3.horizontal(),
              child: _DriveAlert(
                incomingReservation: incomingTripNumber,
                onTap: () => TripListPage.open(context),
              ),
            ),
          ),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ReservationBloc, ReservationState>(
            listener: (context, state) {
              if (state.status == ReservationStateStatus.reservationError) {
                showError(context, message: context.l10n.try_later_error);
              }
            },
          ),
          BlocListener<ReservationBloc, ReservationState>(
            listenWhen: (previous, current) =>
                previous.status != ReservationStateStatus.paymentNeeded &&
                current.status == ReservationStateStatus.paymentNeeded &&
                current.reservation is ValidatedReservation,
            listener: _onReservationConfirmed,
          ),
        ],
        child: LayoutBuilder(builder: (context, constraints) {
          final arrival =
              context.select((ReservationBloc bloc) => bloc.state.arrival);
          final departure =
              context.select((ReservationBloc bloc) => bloc.state.departure);

          return Column(
            children: [
              Expanded(
                child: Map(
                  departure: departure,
                  arrival: arrival,
                ),
              ),
              ConstrainedBox(
                constraints: constraints,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const Padding5(top),
                    child: ReservationForm(
                      departureInitialValue: departureInitialValue,
                      arrivalInitialValue: arrivalInitialValue,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
