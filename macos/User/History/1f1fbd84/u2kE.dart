import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final consultationBill = JsonSerializable('ConsultationBill', {
  jsonField('id', refer('String'), name: 'reference'),
  jsonField('creationDate', refer('DateTime'), name: 'dateCreation'),
  jsonField('consultationId', refer('String'), name: 'rdvId'),
  jsonField('status', refer('String'), name: 'statut'),
  jsonField('quotation', refer('String'), name: 'cotation'),
  jsonField('preAuthorizationTotalExclTaxes', refer('double'),
      name: 'preautorisationTotalHT'),
  jsonField('preAuthTotalInclTaxes', refer('double'),
      name: 'preautorisationTotalTTC'),
  jsonField('totalExclTaxes', refer('double'), name: 'totalHT'),
  jsonField('totalInclTaxes', refer('double'), name: 'totalTTC'),
});
