@freezed
class UserDetails with _$UserDetails {
  const UserDetails._();

  const factory UserDetails.petientDetails({
    final String titre: "M",
    final String nom: "TAYLOR",
    final String prenom: "JAMES",
    final String dateNaissance: "11/11/1991",
    final String email: "jtpro@zanalys.com",
    final String emailSecondaire: null,
    final String telephoneFixe: null,
    final String telephoneMobile: "9564587654",
    final String numeroSecuriteSociale: "876364757888877",
    final String rangNaissance: 0,
    final String lieuNaissance: null,
    final String lieuNaissanceCode: null,
    final String nomNaissance: null,
    final String prenomNaissance: null,
    final String emailPersonneConfiance: null,
    final String nomPersonneConfiance: null,
    final String prenomPersonneConfiance: null,
  }) = PatientDetails;
}
