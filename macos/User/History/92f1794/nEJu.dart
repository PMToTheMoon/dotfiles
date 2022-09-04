import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final models = Root('packages/models/lib/src/', [
  Root('doctor/', [
    // DOCTOR SPECIALTY
    JsonSerializable('DoctorSpecialty', {
      field('id', refer('String')),
      jsonField('displayFr', refer('String'), name: 'libelleFR'),
    }),

    // DOCTOR JOB
    JsonSerializable('DoctorJob', {
      field('id', refer('String')),
      jsonField('displayFr', refer('String'), name: 'libelleFR'),
    }),

    // DOCTOR
    JsonSerializable('Doctor', {
      jsonField('id', refer('String'), name: 'numeroCompteUtilisateur'),
      jsonField('firstName', refer('String'), name: 'prenomUtilisateur'),
      jsonField('lastName', refer('String'), name: 'nomUtilisateur'),
      jsonField(
        'specialty',
        refer('DoctorJob', 'doctor_job.dart'),
        name: 'PrestataireSpecialite',
      ),
      jsonField(
        'specialty',
        refer('DoctorSpecialty', 'doctor_specialty.dart'),
        name: 'PrestataireSpecialite',
      ),
    }),
  ])
]);
