import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final establishment = JsonSerializable('Establishment', root: '', {
  jsonField(
    'doctors',
    refer(
      'List<NetworkDoctor>',
      'package:models/models.dart',
    ),
    name: 'medecins',
  )
});
