import 'package:flutter/material.dart' hide Page;
import 'package:common/common.dart';
import 'package:neat/neat.dart';

class FlightNumberSelectionPageArguments {
  const FlightNumberSelectionPageArguments();
}

class FlightNumberSelectionResult {
  const FlightNumberSelectionResult({
    this.flightNumber,
    this.departureDelay,
  });
  final String? flightNumber;
  final int? departureDelay;
}

class FlightNumberSelectionPage extends StatelessWidget {
  static const String route = "/flight_number_selection";

  static Widget builder(BuildContext context) {
    try {
      final args = ModalRoute.of(context)!.settings.arguments
          as FlightNumberSelectionPageArguments;
      return FlightNumberSelectionPage(
        arguments: args,
      );
    } catch (_) {
      throw InvalidPageArguments<FlightNumberSelectionPage>();
    }
  }

  static Future<FlightNumberSelectionResult> open(
    BuildContext context,
    FlightNumberSelectionPageArguments arguments,
  ) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FlightNumberSelectionPage(arguments: arguments),
      ),
    );
    return result as FlightNumberSelectionResult;
  }

  static void goBack(
    BuildContext context, {
    String? flightNumber,
    int departureDelay = 0,
  }) =>
      Navigator.of(context).pop(
        FlightNumberSelectionResult(
          flightNumber: flightNumber,
          departureDelay: departureDelay,
        ),
      );

  const FlightNumberSelectionPage({
    required this.arguments,
    Key? key,
  }) : super(key: key);

  final FlightNumberSelectionPageArguments arguments;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        goBack(context);
        return false;
      },
      child: const _FlightNumberSelectionPage(),
    );
  }
}

class _FlightNumberSelectionPage extends StatefulWidget {
  const _FlightNumberSelectionPage({
    Key? key,
  }) : super(key: key);

  @override
  _FlightNumberSelectionPageState createState() =>
      _FlightNumberSelectionPageState();
}

class _FlightNumberSelectionPageState
    extends State<_FlightNumberSelectionPage> {
  _FlightNumberSelectionPageState();

  String? flightNumber;
  int departureDelay = 0;

  @override
  Widget build(BuildContext context) {
    return Page(
      appBar: titledAppBar(
        context,
        title: context.l10n.select_flight_number_page_title,
        onBack: () => FlightNumberSelectionPage.goBack(context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            onChanged: (value) => setState(() {
              flightNumber = value;
            }),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: context.l10n.flight_number_field_hint,
            ),
          ),
          const Space3.h(),
          context.subtitle2("Décaler l'arrivée du chauffeur"),
          const Space5.h(),
          context.bodyText1(
              "Afin de passer les formalités en toute sérénité, vous pouvez demander à ce que votre chauffeur arrive après l'heure d'arrivée effective de votre vol."),
          const Space4.h(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              context.bodyText1("(+10 mn) "),
              context.subtitle2("07:19"),
            ],
          ),
          Slider(
            value: 0.5,
            min: 0,
            max: 30,
            divisions: 5,
            onChanged: (_) {},
          ),
          Button.primary(
            context.l10n.validate,
            () => FlightNumberSelectionPage.goBack(
              context,
              flightNumber: flightNumber,
              departureDelay: departureDelay,
            ),
          ),
          const Space3.h(),
          TextButton(
            onPressed: () => FlightNumberSelectionPage.goBack(context),
            child: Text(context.l10n.no_flight_number_button),
          ),
        ],
      ),
    );
  }
}
