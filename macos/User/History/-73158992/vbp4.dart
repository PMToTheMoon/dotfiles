// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details.freezed.dart';
part 'user_details.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.screamingSnake)
class UserDetails with _$UserDetails {
  const UserDetails._();

  const factory UserDetails.patient({
    required PatientDetails user,
  }) = UserDetailsPatient;

  factory UserDetails fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);
}

@freezed
class PatientDetails with _$PatientDetails {
  const factory PatientDetails({
    @JsonKey(name: 'titre') required String gender,
    @JsonKey(name: 'nom') required String lastName,
    @JsonKey(name: 'prenom') required String firstName,
    @JsonKey(name: 'dateNaissance') required String birthDate,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'telephoneFix') required String? homePhoneNumber,
    @JsonKey(name: 'telephoneMobile') required String? mobilePhoneNumber,
    @JsonKey(name: 'lieuNaissance') required String? birthPlace,
    @JsonKey(name: 'lieuNaissanceCode') required String? birthPlaceZipCode,
    @JsonKey(name: 'nomNaissance') required String? birthLastName,
    @JsonKey(name: 'prenomNaissance') required String? birthFirstName,
  }) = _PatientDetails;
}
