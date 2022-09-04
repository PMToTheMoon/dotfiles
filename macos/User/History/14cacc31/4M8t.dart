import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:common/common.dart' as domain;
import 'billing_address.dart';
import 'passenger.dart';
import 'address.dart';
import 'trip.dart';
import 'payment.dart';

part 'getme.freezed.dart';
part 'getme.g.dart';

@freezed
class Getme with _$Getme {
  const Getme._();

  const factory Getme({
    required int userid,
    required String user,
    required String firstname,
    required String lastname,
    required String company,
    required String mobilea,
    required String mobileb,
    required String email,
    required String emailcopy,
    required BillingAddress billing_address,
    required List<Passenger> favorites_persons,
    required List<Address> favorites_address,
    required List<Trip> last_trip,
    required List<Payment> payments,
  }) = _Getme;

  factory Getme.fromJson(Map<String, dynamic> json) => _$GetmeFromJson(json);

  domain.User toDomain() {
    domain.User(
      infos: _toDomainUserInfos,
      billingAddress: billing_address.toDomain,
      favoritePassengers: favorites_persons.map((p) => p.toDomain).toList(),
      favoriteAddresses: favorites_address.map((a) => a.toDomain).toList(),
      trips: last_trip.map((t) => t.toDomain()).toList(),
      paymentMethods: payments.map((p) => p.toDomain).toList(),
    );
  }

  domain.UserInfos get _toDomainUserInfos => domain.UserInfos(
        userID: userid,
        user: user,
        firstName: firstname,
        lastName: lastname,
        company: company,
        mobileA: mobilea,
        mobileB: mobileb,
        email: email,
        emailCopy: emailcopy,
      );
}
