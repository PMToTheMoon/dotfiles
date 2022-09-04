import 'package:app_client/address_selection/address_selection.dart';
import 'package:app_client/external_pages/external_pages.dart';
import 'package:app_client/home/home.dart';
import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:neat/neat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:app_client/map/map.dart';
import 'package:app_client/trip_details/trip_details.dart';

part '_cancellation_confirmation_dialog.dart';
part '_trip_comment_editor.dart';

class TripDetailsPageArguments {
  const TripDetailsPageArguments(this.trip);

  final Trip trip;
}

class TripDetailsPage extends StatelessWidget {
  static const String route = "/trip_details";

  static Widget builder(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments
          as TripDetailsPageArguments;
      return TripDetailsPage(
        arguments: args,
      );
    } catch (_) {
      throw InvalidPageArguments<TripDetailsPage>();
    }
  }

  static Future<void> open(
    BuildContext context,
    TripDetailsPageArguments arguments,
  ) async =>
      await Navigator.of(context).pushNamed(
        route,
        arguments: arguments,
      );

  const TripDetailsPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final TripDetailsPageArguments arguments;

  _onStateChanged(BuildContext context, TripDetailsState state) {
    if (state is TripCancellationError) {
      showDialog(
        context: context,
        builder: (ctx) => ErrorDialog(
          title: context.l10n.trip_cancellation_refused_1h_limit_message,
        ),
      );
    }
    if (state is TripDetailsUnexpectedError) {
      showDialog(
        context: context,
        builder: (ctx) => ErrorDialog(
          title: context.l10n.try_later_error,
        ),
      );
    }
    if (state is TripCancellationSuccess) {
      Navigator.of(context).pop();
      showDialog(
        context: context,
        builder: (ctx) => SuccessDialog(
          title: context.l10n.trip_successfully_cancelled_message,
        ),
      );
    }
    if (state is TripDetailsExit) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripDetailsBloc(
        trip: arguments.trip,
        userRepository: context.read(),
        reservationRepository: context.read(),
      ),
      child: BlocListener<TripDetailsBloc, TripDetailsState>(
        listener: _onStateChanged,
        child: const _TripDetailsPage(),
      ),
    );
  }
}

class _TripDetailsPage extends StatelessWidget {
  const _TripDetailsPage({
    Key? key,
  }) : super(key: key);

  void _onBookReturnTrip(BuildContext context, Trip trip) async {
    DateTime? date;
    String? trainNumber;
    String? flightNumber;
    int? departureDelay;
    Address _departure = trip.departure;

    if (_departure.type == AddressType.train) {
      final result = await TrainNumberSelectionPage.open(
        context,
        const TrainNumberSelectionPageArguments(),
      );
      trainNumber = result.trainNumber;
    } else if (_departure.type == AddressType.airport) {
      final state = context.read<AddressSelectionBloc>().state;
      final result = await FlightNumberSelectionPage.open(
        context,
        FlightNumberSelectionPageArguments(
          date: state.date,
        ),
      );
      date = result?.date;
      flightNumber = result?.flightNumber;
      departureDelay = result?.departureDelay;
      _departure = result?.departureAirport ?? _departure;
    }

    Navigator.of(context).pushNamedAndRemoveUntil(
      HomePage.route,
      (_) => false,
      arguments: HomePageArguments(
        arrival: _departure,
        departure: trip.arrival,
      ),
    );
  }

  void _onCancelPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => _CancellationConfirmationDialog(
        onConfirm: () => context
            .read<TripDetailsBloc>()
            .add(const TripDetailsEvent.tripCancellationRequested()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trip = context.select((TripDetailsBloc bloc) => bloc.state.trip);

    return Page(
      padding: EdgeInsets.zero,
      appBar: titledAppBar(context, title: context.l10n.trip_details_page_tile),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.longestSide * 0.33,
            child: Map(
              arrival: trip.arrival,
              departure: trip.departure,
              gestureEnabled: false,
            ),
          ),
          Padding(
            padding: const PaddingPage.all(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TripDetails(trip),
                const Space4.h(),
                Button.menu(
                  context.l10n.book_return_trip_button,
                  () => _onBookReturnTrip(context, trip),
                  color: context.colorScheme.onSurface,
                ),
                Button.menu(
                  context.l10n.signal_trip_problem_button,
                  () => ReportProblemPage.open(context),
                  color: context.colorScheme.onSurface,
                ),
                if (trip.transactionID != null)
                  Padding(
                    padding: const Padding4(top),
                    child: _TripCommentEditor(
                      transactionID: trip.transactionID!,
                      initialComment: trip.comment,
                    ),
                  ),
                if (trip.transactionID != null)
                  Padding(
                    padding: const Padding3(top),
                    child: Button.menu(
                      context.l10n.cancel_trip_button,
                      () => _onCancelPressed(context),
                      arrow: false,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
