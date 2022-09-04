import 'package:common/common.dart';

class AddressSelectionResult {
  const AddressSelectionResult({
    this.departureAddress,
    this.arrivalAddress,
    this.departureTrainNumber,
    this.departureFlightNumber,
    this.departureDelay,
    this.departureDate,
  });
  final Address? departureAddress;
  final Address? arrivalAddress;
  final String? departureTrainNumber;
  final String? departureFlightNumber;
  final int? departureDelay;
  final DateTime? departureDate;
}
