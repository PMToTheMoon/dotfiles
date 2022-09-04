@freezed
class UserDetails with _$UserDetails {
  const UserDetails._();

  const factory UserDetails.petientDetails({
    @JsonKey(name: 'titre') required String titre,
    @JsonKey(name: 'nom') required String nom,
    @JsonKey(name: 'prenom') required String prenom,
    @JsonKey(name: 'dateNaissance') required String dateNaissance,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'telephoneFix') required String? telephoneFix,
    @JsonKey(name: 'telephoneMobile') required String? telephoneMobile,
    @JsonKey(name: 'lieuNaissance') required String? lieuNaissance,
    @JsonKey(name: 'lieuNaissanceCode') required String? lieuNaissanceCode,
    @JsonKey(name: 'nomNaissance') required String? nomNaissance,
    @JsonKey(name: 'prenomNaissance') required String? prenomNaissance,
  }) = PatientDetails;
}
