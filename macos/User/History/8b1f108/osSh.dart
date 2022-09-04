import 'package:model_generators/model_generators.dart';

final doctors = Root('doctor/', [
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
    jsonField(
      'id',
      refer('String'),
      name: 'numeroCompteUtilisateur',
    ),
    jsonField(
      'firstName',
      refer('String'),
      name: 'prenomUtilisateur',
    ),
    jsonField(
      'lastName',
      refer('String'),
      name: 'nomUtilisateur',
    ),
    jsonField(
      'job',
      refer('DoctorJob', 'doctor_job.dart'),
      name: 'PrestataireProfession',
    ),
    jsonField(
      'specialty',
      refer('DoctorSpecialty', 'doctor_specialty.dart'),
      name: 'PrestataireSpecialite',
    ),
  }),
]);
