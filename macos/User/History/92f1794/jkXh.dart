import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final models = Root('packages/lib/src/', [
  Root('doctor/', [
    JsonSerializable('doctor_specialty', {
      field('id', refer('String')),
      jsonField('displayFr', refer('String'), name: 'libelleFR'),
    }),
    JsonSerializable('doctor_job', {
      field('id', refer('String')),
      jsonField('displayFr', refer('String'), name: 'libelleFR'),
    })
  ])
]);
