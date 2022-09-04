part of 'reservation_bloc.dart';

enum ReservationStateStatus {
  loading,
  editing,
  reservationError,
  estimationRequested,
  estimationReceived,
  commandPassed,
  paymentNeeded,
  payed,
}

@freezed
class ReservationState with _$ReservationState {
  const ReservationState._();

  const factory ReservationState({
    required ReservationStateStatus status,
    UserInfos? userInfos,
    Vehicle? vehicle,
    DateTime? date,
    Address? departure,
    Address? arrival,
    String? trainNumber,
    String? flightNumber,
    int? departureDelay,
    PaymentMethod? paymentMethod,
    Passenger? passenger,
    ReservationEstimate? estimate,
    Reservation? reservation,
  }) = _ReservationState;

  bool get isLoading => status == ReservationStateStatus.loading;

  bool get isEditing => status == ReservationStateStatus.editing;

  bool get isEstimationRequested =>
      status == ReservationStateStatus.estimationRequested;

  bool get isEstimationReceived =>
      status == ReservationStateStatus.estimationReceived;

  bool get isPaymentNeeded => status == ReservationStateStatus.paymentNeeded;

  bool get isPayed => status == ReservationStateStatus.payed;

  bool get areAddressesFilled => departure != null && arrival != null;

  bool get areAddressesDifferent => departure != arrival;

  bool get shouldSelectCostCenter {
    final method = paymentMethod;
    return method is CompanyPaymentMethod &&
        method.costCenter == null &&
        method.availableCostCenters.isNotEmpty;
  }

  bool get isValid =>
      userInfos != null &&
      vehicle != null &&
      date != null &&
      date!.isAfter(DateTime.now()) &&
      paymentMethod != null &&
      areAddressesFilled &&
      areAddressesDifferent &&
      shouldSelectCostCenter == false;

  bool get displayLoadingPrice => isEstimationRequested;

  bool get displayPrice =>
      estimate != null && (isEstimationReceived || isPaymentNeeded || isPayed);

  bool get enableCommandButton => isValid && isEstimationReceived;

  bool get freezForm =>
      status != ReservationStateStatus.editing &&
      status != ReservationStateStatus.estimationReceived;

  DateTime? get dateWithDepartureDelay => departureDelay != null
      ? date?.add(Duration(minutes: departureDelay ?? 0))
      : date;

  ReservationRequest? get reservationRequest {
    try {
      return ReservationRequest(
        vehicle: vehicle!,
        arrival: arrival!,
        departure: departure!,
        date: date!,
        paymentMethod: paymentMethod!,
        passenger: passenger,
        trainNumber: trainNumber,
        flightNumber: flightNumber,
        departureDelay: departureDelay,
      );
    } catch (e) {
      return null;
    }
  }
}
