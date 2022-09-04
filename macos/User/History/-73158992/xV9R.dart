// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details.dart'

@freezed
class UserDetails with _$UserDetails {
  const UserDetails._();

  const factory UserDetails.petientDetails({
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
  }) = PatientDetails;
}
