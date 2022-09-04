import 'package:common/common.dart';

enum AddressSelectionFocus {
  departure,
  arrival,
}

class AddressSelectionPageArguments {
  const AddressSelectionPageArguments.focusDeparture({
    this.initialDeparture,
    this.initialArrival,
    this.initialDate,
  }) : initialFocus = AddressSelectionFocus.departure;

  const AddressSelectionPageArguments.focusArrival({
    this.initialDeparture,
    this.initialArrival,
    this.initialDate,
  }) : initialFocus = AddressSelectionFocus.arrival;

  final DateTime? initialDate;
  final Address? initialDeparture;
  final Address? initialArrival;
  final AddressSelectionFocus initialFocus;
}
