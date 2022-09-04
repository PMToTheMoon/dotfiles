import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final consultationBillFields ={
  /** Numéro de commande Zanalys */
  jsonField('id', refer('String'), name:'reference')
  jsonField('creationDate', refer('DateTime'), name:'dateCreation')
  jsonField('consultationId', refer('id'),name:'rdvId'),
  jsonField('status', refer('String'), name:'statut'),
  jsonField('quotation', refer('String'), name:'cotation')
  
  jsonField(name:'preautorisationTotalHT')
  double get preAuthorizationTotalExclTaxes;

  /** Montant TTC de la préautorisation. */
  jsonField(name:'preautorisationTotalTTC')
  double get preAuthTotalInclTaxes;

  /** Montant hors taxe de la commande. */
  jsonField(name:'totalHT')
  double get totalExclTaxes;

  /** Montant TTC de la commande. */
  jsonField(name:'totalTTC')
  double get totalInclTaxes;
}