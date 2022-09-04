import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final establishment = Path('establishment/', [
  JsonSerializable(
    'Establishment',
    {
      jsonField(
        'doctors',
        refer(
          'List<Doctor>',
          'package:models/models.dart',
        ),
        name: 'medecins',
      )
    },
  ),
]);
