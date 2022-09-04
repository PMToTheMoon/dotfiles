import 'dart:async';

import 'package:flutter/cupertino.dart' show CupertinoDatePickerMode;
import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:intl/intl.dart';
import 'package:neat/neat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';

import 'package:app_client/address_selection/address_selection.dart';

class FlightNumberSelectionPageArguments {
  const FlightNumberSelectionPageArguments({
    required this.date,
  });

  final DateTime? date;
}

class FlightNumberSelectionResult {
  const FlightNumberSelectionResult({
    required this.date,
    required this.flightNumber,
    required this.departureAirport,
    this.departureDelay = 0,
  });
  final DateTime? date;
  final String? flightNumber;
  final int departureDelay;
  final FavoriteAddress? departureAirport;
}

class FlightNumberSelectionPage extends StatelessWidget {
  static Future<FlightNumberSelectionResult?> open(
    BuildContext context,
    FlightNumberSelectionPageArguments arguments,
  ) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlightNumberSelectionPage(arguments: arguments),
      ),
    );
    if (result == null) return null;
    return result as FlightNumberSelectionResult;
  }

  static void goBack(
    BuildContext context, [
    FlightNumberSelectionResult? result,
  ]) =>
      Navigator.of(context).pop(result);

  const FlightNumberSelectionPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final FlightNumberSelectionPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightSelectionBloc(
        userRepository: context.read(),
        reservationRepository: context.read(),
      ),
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: _FlightNumberSelectionPage(
          arguments: arguments,
        ),
      ),
    );
  }
}

class _FlightNumberSelectionPage extends StatefulWidget {
  const _FlightNumberSelectionPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  final FlightNumberSelectionPageArguments arguments;

  @override
  _FlightNumberSelectionPageState createState() =>
      _FlightNumberSelectionPageState();
}

class _FlightNumberSelectionPageState
    extends State<_FlightNumberSelectionPage> {
  _FlightNumberSelectionPageState();

  @override
  void initState() {
    super.initState();
    date = widget.arguments.date;

    _stateSubscription =
        context.read<FlightSelectionBloc>().stream.listen((state) {
      if (state is FlightSelectionSuccess) {
        setState(() {
          date = state.data.arrivalTime;
        });
      }
    });
  }

  @override
  void dispose() {
    _stateSubscription.cancel();
    super.dispose();
  }

  DateTime? date;
  String? flightNumber;
  int departureDelay = 0;
  late final StreamSubscription<FlightSelectionState> _stateSubscription;

  void _onDateSelected(DateTime? selected) {
    setState(() {
      date = selected;
    });
    context
        .read<FlightSelectionBloc>()
        .add(FlightSelectionEvent.formDataChanged(
          flightNumber: flightNumber,
          date: selected,
        ));
  }

  void _onFlightNumberEditingComplete() {
    context
        .read<FlightSelectionBloc>()
        .add(FlightSelectionEvent.formDataChanged(
          flightNumber: flightNumber,
          date: date,
        ));
  }

  void _onValidatePressed() {
    final state = context.read<FlightSelectionBloc>().state;
    late final FlightNumberSelectionResult? result;
    if (state is FlightSelectionSuccess) {
      result = FlightNumberSelectionResult(
        date: state.data.arrivalTime,
        flightNumber: state.data.flightNumber,
        departureAirport: state.airport,
        departureDelay: departureDelay,
      );
    } else {
      result = null;
    }
    FlightNumberSelectionPage.goBack(
      context,
      result,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: titledAppBar(
        context,
        title: context.l10n.select_flight_number_page_title,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DatePickerButton(
            date: date,
            onDateSelected: _onDateSelected,
            minuteInterval: 5,
            mode: CupertinoDatePickerMode.date,
          ),
          const Space4.h(),
          TextField(
            onChanged: (value) => setState(() {
              flightNumber = value;
            }),
            onEditingComplete: _onFlightNumberEditingComplete,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: context.l10n.flight_number_field_label,
              hintText: context.l10n.flight_number_field_hint,
            ),
          ),
          _FlightResult(
            onValidateNotFoundNumber: () => FlightNumberSelectionPage.goBack(
              context,
              FlightNumberSelectionResult(
                date: date,
                flightNumber: flightNumber,
                departureAirport: null,
              ),
            ),
          ),
          const Space3.h(),
          _DepartureDelay(
            initialDate: date,
            departureDelay: departureDelay,
            onDelayChanged: (delay) => setState(() {
              departureDelay = delay.toInt();
            }),
          ),
          _SubmitButton(
            onPressed: _onValidatePressed,
          ),
        ],
      ),
    );
  }
}

class _FlightResult extends StatelessWidget {
  const _FlightResult({
    Key? key,
    required this.onValidateNotFoundNumber,
  }) : super(key: key);

  final VoidCallback onValidateNotFoundNumber;

  @override
  Widget build(BuildContext context) {
    final state = context.select((FlightSelectionBloc bloc) => bloc.state);

    if (state is FlightSelectionSubmittingFlightNumber) {
      return const Padding(
        padding: Padding4.all(),
        child: LoadingIndicator.small(),
      );
    }

    if (state is FlightSelectionSuccess) {
      late final String label;
      final date = state.data.arrivalTime;
      final place = state.airport?.label;

      return Padding(
        padding: const Padding4(top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.subtitle2(context.l10n.flight_arrival_title),
            const Space5.h(),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: Dimensions.icon2,
                ),
                const Space5.w(),
                Expanded(child: Text(date.fullDateTimeDisplay(context)))
              ],
            ),
            const Space5.h(),
            if (place != null)
              Row(
                children: [
                  Icon(
                    Icons.flight_land_rounded,
                    size: Dimensions.icon2,
                    color: context.colorScheme.primary,
                  ),
                  const Space5.w(),
                  Expanded(child: Text(place))
                ],
              )
          ],
        ),
      );
    }

    if (state is FlightSelectionError) {
      return Padding(
        padding: const Padding4.all(),
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(
              context.l10n.no_flight_found_message,
              textAlign: TextAlign.center,
            ),
            Button.text(
              context.l10n.flight_continue_with_unfound_number,
              onValidateNotFoundNumber,
              color: context.colorScheme.tertiary,
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

class _DepartureDelay extends StatelessWidget {
  const _DepartureDelay({
    required this.initialDate,
    required this.departureDelay,
    required this.onDelayChanged,
    Key? key,
  }) : super(key: key);

  final DateTime? initialDate;
  final int departureDelay;
  final ValueChanged<int> onDelayChanged;

  String get _delayedDepartureHour {
    final d = initialDate?.add(Duration(minutes: departureDelay));
    if (d == null) return '';
    return DateFormat.Hm().format(d);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((FlightSelectionBloc bloc) => bloc.state);

    if (state is! FlightSelectionSuccess) return const SizedBox.shrink();

    return FadeIn(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          context.subtitle2(context.l10n.departure_delay_title),
          const Space5.h(),
          context.bodyText2(
            context.l10n.departure_delay_text,
            textAlign: TextAlign.justify,
          ),
          const Space4.h(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              context.bodyText1("(+$departureDelay mn) "),
              context.subtitle2(_delayedDepartureHour),
            ],
          ),
          Slider(
            label: "+$departureDelay",
            value: departureDelay.toDouble(),
            min: 0,
            max: 30,
            divisions: 6,
            onChanged: (value) => onDelayChanged(value.toInt()),
          ),
          const Space3.h(),
        ],
      ),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final state = context.select((FlightSelectionBloc bloc) => bloc.state);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Button.primary(
          context.l10n.validate,
          state is FlightSelectionSuccess ? onPressed : null,
        ),
        const Space4.h(),
        Button.text(
          context.l10n.flight_skip_page,
          () => FlightNumberSelectionPage.goBack(context),
        ),
        const Space3.h(),
      ],
    );
  }
}
