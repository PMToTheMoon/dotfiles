import 'package:model_generators/model_generators.dart';

final providerSpecialty = JsonSerializable('ProviderSpecialty', {
  jsonField('id', refer('int'), name: 'identifiant'),
  jsonField('displayFr', refer('String'), name: 'libelleFr'),
});
