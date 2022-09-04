import 'package:built_value/built_value.dart';

/// CommandeRdv in back-end
abstract class CommandeRdv {
  /** Numéro de commande Zanalys */
  @BuiltValueField(wireName: 'reference')
  String get id;

  /** Date de création de la commande (unix timestamp) */
  @BuiltValueField(wireName: 'dateCreation')
  DateTime get creationDate;

  /** ID du RDV pour la commande */
  @BuiltValueField(wireName: 'rdvId')
  int get consultationId;

  /** Statut de la commande **/
  @BuiltValueField(wireName: 'statut')
  String get status;

  /** Cotation de la commande **/
  @BuiltValueField(wireName: 'cotation')
  String get quotation;

  /** Montant hors taxe de la préautorisation. */
  @BuiltValueField(wireName: 'preautorisationTotalHT')
  double get preAuthorizationTotalExclTaxes;

  /** Montant TTC de la préautorisation. */
  @BuiltValueField(wireName: 'preautorisationTotalTTC')
  double get preAuthTotalInclTaxes;

  /** Montant hors taxe de la commande. */
  @BuiltValueField(wireName: 'totalHT')
  double get totalExclTaxes;

  /** Montant TTC de la commande. */
  @BuiltValueField(wireName: 'totalTTC')
  double get totalInclTaxes;
}
