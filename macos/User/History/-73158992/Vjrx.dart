@freezed
class UserDetails with _$UserDetails {
  const UserDetails._();

  const factory UserDetails.petientDetails({
    required String titre,
    required String nom,
    required String prenom,
    required String dateNaissance,
    required String email,
    required String? telephoneFix,
    required String? telephoneMobile,
    required String? lieuNaissance,
    required String? lieuNaissanceCode,
    required String? nomNaissance,
    required String? prenomNaissance,
  }) = PatientDetails;
}
