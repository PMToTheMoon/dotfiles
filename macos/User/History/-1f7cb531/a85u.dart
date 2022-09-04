import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:common/common.dart' as domain;
import 'package:common/common.dart';

part 'set_trip.freezed.dart';
part 'set_trip.g.dart';

@freezed
class SetTripRequest with _$SetTripRequest {
  const SetTripRequest._();

  const factory SetTripRequest({
    @JsonKey(name: "userid") required int userID,
    @JsonKey(name: "payment_id") required int paymentID,
    @JsonKey(name: "payment_cost_center") String? paymentCostCenter,
    @JsonKey(name: "favorites_persons") @Default([]) List<int> favoritePersons,
    @JsonKey(name: "departure") required Map<String, dynamic> departure,
    @JsonKey(name: "arrival") required Map<String, dynamic> arrival,
    @JsonKey(name: "date") required DateTime date,
    @JsonKey(name: "vehicule") required String vehicle,
    @JsonKey(name: "trainnumber") String? trainNumber,
    @JsonKey(name: "flightnumber") String? flightNumber,
    @JsonKey(name: "timedelta") String? departureDelay,
  }) = _SetTripRequest;

  factory SetTripRequest.fromDomain({
    required int userID,
    required domain.ReservationRequest request,
  }) =>
      SetTripRequest(
        userID: userID,
        paymentID: request.paymentMethod.id,
        paymentCostCenter: request.paymentMethod.maybeMap(
          company: (c) => c.costCenter,
          orElse: () => null,
        ),
        departure: _addressToJson(request.departure),
        arrival: _addressToJson(request.arrival),
        date: request.date,
        vehicle: _vehicleToString(request.vehicle),
        trainNumber: request.trainNumber,
        flightNumber: request.flightNumber,
        departureDelay: request.departureDelay.toString(),
        favoritePersons: [
          if (request.passenger != null) request.passenger!,
        ],
      );

  factory SetTripRequest.fromJson(Map<String, dynamic> json) =>
      _$SetTripRequestFromJson(json);

  static Map<String, dynamic> _addressToJson(domain.Address address) {
    if (address is domain.FavoriteAddress) {
      return {
        "id": address.id,
        "address": address.address,
      };
    }
    if (address is domain.SuggestedAddress) {
      return {
        "label": address.label,
        "type": _addressTypeToString(address.type),
        "address": address.address,
        "postcode": address.postCode,
        "place": address.place,
        "region": address.region,
        "country_code": address.countryCode,
        "center": address.center,
      };
    }
    throw Unimplemented();
  }

  static String _addressTypeToString(domain.AddressType type) {
    switch (type) {
      case domain.AddressType.location:
        return "address";
      case domain.AddressType.airport:
        return "airport";
      case domain.AddressType.train:
        return "train";
      default:
        throw Unimplemented();
    }
  }

  static String _vehicleToString(domain.Vehicle vehicle) {
    switch (vehicle) {
      case domain.Vehicle.berlin:
        return "Berline";
      case domain.Vehicle.motorcycle:
        return "Moto";
      default:
        throw Unimplemented();
    }
  }
}

@freezed
class SetTripResult with _$SetTripResult {
  const SetTripResult._();

  const factory SetTripResult({
    @JsonKey(name: "proposal_id") required int id,
    @JsonKey(name: "amount_HT") required String priceWithoutTaxes,
    @JsonKey(name: "amount_TTC") required String price,
    @JsonKey(name: "tva") required String vat,
    @JsonKey(name: "tva_rate") required String vatPercent,
    @JsonKey(name: "currency") required String currency,
  }) = _SetTripResult;

  factory SetTripResult.fromJson(Map<String, dynamic> json) =>
      _$SetTripResultFromJson(json);

  domain.ReservationEstimate get toDomain => domain.ReservationEstimate(
        id: id,
        priceWithoutTaxes: double.parse(priceWithoutTaxes),
        price: double.parse(price),
        vat: double.parse(vat),
        vatPercent: double.parse(vatPercent),
        currency: currency,
      );
}
