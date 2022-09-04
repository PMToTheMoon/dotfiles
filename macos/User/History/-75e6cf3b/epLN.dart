import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final establishment = JsonSerializable('Establishment', {
  jsonField(
      'doctors',
      refer(
        'List<NetworkDoctor>',
        'package:models/models.dart',
      ))
});
