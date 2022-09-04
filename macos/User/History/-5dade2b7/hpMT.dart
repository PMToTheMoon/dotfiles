class Patient {
  
    numeroSecuriteSociale!: string;
    /** Profil de l'utilisateu patient qui sera PATIENT **/
    profil!: any;
    /** Mutuelle du patient **/
    mutuelle!: any;
    /** Régime sécurité sociale du patient **/
    regimeSecuriteSociale!: any; // RegimeSecuriteSociale;

    /** Rang de naissance du patient. */
    rangNaissance!: number;
    /** Lieu de naissance du patient. */
    lieuNaissance!: string;
    /** Code INSEE du lieu de naissance du patient. */
    lieuNaissanceCode!: string;
    /** Nom de naissance du patient. */
    nomNaissance!: string;
    /** Prénom de naissance du patient. */
    prenomNaissance!: string;

    validationCode!: string;
    validationCodeDateCreation!: string;

    /** Indique si l'utilisateur a accepté les dernières CGU. **/
    cguAcceptee!: boolean;

    /** L'adresse mail du compte est en réalité celle de la personne de confiance **/
    emailPersonneConfiance: boolean;
    /** Nom de la personne de confiance **/
    nomPersonneConfiance: string;
    /** Prénom de la personne de confiance **/
    prenomPersonneConfiance: string;


}