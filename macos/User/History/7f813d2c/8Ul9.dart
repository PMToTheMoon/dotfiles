enum EnumRdvStatut {
    @JsonValue('EN_ATTENTE_PAIEMENT'),
    @JsonValue('ECHEC_PAIEMENT'),
    @JsonValue('VALIDE'),
    @JsonValue('ANNULE'),
    @JsonValue('PATIENT_ABSENT'),
    @JsonValue('TERMINE'),
}