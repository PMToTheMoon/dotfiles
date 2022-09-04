import 'package:common/common.dart';

enum AddressSelectionFocus {
  departure,
  arrival,
}

class AddressSelectionPageArguments {
  const AddressSelectionPageArguments.focusDeparture({
    required this.initialDeparture,
    required this.initialArrival,
    required this.initialDate,
    required this.initialFlightNumber,
    required this.initialTrainNumber,
    required this.initialDepartureDelay,
  }) : initialFocus = AddressSelectionFocus.departure;

  const AddressSelectionPageArguments.focusArrival({
    required this.initialDeparture,
    required this.initialArrival,
    required this.initialDate,
    required this.initialFlightNumber,
    required this.initialTrainNumber,
    required this.initialDepartureDelay,
  }) : initialFocus = AddressSelectionFocus.arrival;

  /// used to initialize flight selection date
  final DateTime? initialDate;
  final Address? initialDeparture;
  final Address? initialArrival;
  final AddressSelectionFocus initialFocus;
  final String? initialFlightNumber;
  final String? initialTrainNumber;
  final int initialDepartureDelay;
}
