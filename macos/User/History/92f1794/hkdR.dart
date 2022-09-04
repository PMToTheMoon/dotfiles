import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final models = Root('packages/models/lib/src/', [
  Root('doctor/', [
    // DOCTOR SPECIALTY
    JsonSerializable('doctor_specialty', {
      field('id', refer('String')),
      jsonField('displayFr', refer('String'), name: 'libelleFR'),
    }),

    // DOCTOR JOB
    JsonSerializable('doctor_job', {
      field('id', refer('String')),
      jsonField('displayFr', refer('String'), name: 'libelleFR'),
    }),

    // DOCTOR
    JsonSerializable('doctor', {
      jsonField('id', refer('String'), name: 'numeroCompteUtilisateur'),
      jsonField('firstName', refer('String'), name: 'nomUtilisateur:'),
    }),
  ])
]);
