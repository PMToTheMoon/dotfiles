import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final consultationType = JsonSerializable('ConsultationType', {
  jsonField('id', refer('int'), name: 'identifiant'),
  jsonField('displayFr', refer('String'), name: 'libelleFr'),
});
