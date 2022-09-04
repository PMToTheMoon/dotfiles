enum RecordStatus {
      NOUVEAU,
    BROUILLON,
    // Le patient doit prendre son RDV (ça peut aussi être le cas si on est à l'état EN_ATTENTE_RAPPORT_COMPLET)
    EN_ATTENTE_RDV,
    // Le RDV a été pris, mais le paiement ne peut pas encore être fait (> 6 jours)
    EN_ATTENTE_PAIEMENT_FUTUR,
    // Le RDV a été pris, mais le paiement est à faire
    EN_ATTENTE_PAIEMENT,
    /* Statut obsolète depuis 2021 : Il servait à indiquer que le dossier avait été créé, mais devait encore être
     * affecté à un prestataire. C'est désormais la prise de RDV qui provoque l'affectation
     */
    EN_ATTENTE_TELECHARGEMENT,
    // En attente d'interprétation par le prestataire
    EN_ATTENTE_RAPPORT,
    /* Le prestataire a donné un premier avis sous forme de téléexpertise.
     * En attente d'un second avis via TC ou présentiel
     */
    EN_ATTENTE_RAPPORT_COMPLET,
    EN_ATTENTE_RAPPORT_MEDECIN,
    /* Le médecin référent doit examiner le rapport de l'expert, décider ce qu'il met à disposition du patient.
     * Soit il clôture le dossier, soit il le renvoie à l'expert
     */
    EN_ATTENTE_AVIS_MEDECIN,
    CLOTURE,
    CLOTURE_ANOMALIE,
    ABANDONNE_PRESTATAIRE,
    REFUSE_PRESTATAIRE,
    // Suite à EN_ATTENTE_AVIS_MEDECIN lorsque le référent a renvoyé le dossier à l'expert
	REFUSE_MEDECIN,
    DETRUIT,
}

@freezed
class Record with _$Record {
  const Record._();

  const factory Record.cspUserRecord({

  }) = CspUserRecord;
}