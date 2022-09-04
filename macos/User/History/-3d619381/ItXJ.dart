/// CommandeRdv in back-end
abstract class CommandeRdv {
    /** Numéro de commande Zanalys */
    reference: string;
    String get id;
    
    /** Date de création de la commande (unix timestamp) */
    dateCreation: number;
    DateTime get creationDate;


    /** ID du RDV pour la commande */
    rdvId: number;
    int get consultationId;

    /** Statut de la commande **/
    statut: string; // EnumCommandeStatut

    /** Cotation de la commande **/
    cotation: string;

    /** Montant hors taxe de la préautorisation. */
    preautorisationTotalHT: number;
    /** Montant TTC de la préautorisation. */
    preautorisationTotalTTC: number;

    /** Montant hors taxe de la commande. */
    totalHT: number;
    /** Montant TTC de la commande. */
    totalTTC: number;
}
