import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final doctorSpecialty = JsonSerializable('DoctorSpecialty', {
  jsonField('id', refer('String'), name: 'identifiant'),
  jsonField('displayFr', refer('String'), name: 'libelleFR'),
});

final doctorJob = JsonSerializable('DoctorJob', {
  jsonField('id', refer('String'), name: 'identifiant'),
  jsonField('displayFr', refer('String'), name: 'libelleFR'),
});

final doctor = JsonSerializable('Doctor', {
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
    name: 'profession',
  ),
  jsonField(
    'specialty',
    refer('DoctorSpecialty', 'doctor_specialty.dart'),
    name: 'specialite',
  ),
});

final networkDoctor = JsonSerializable('NetworkDoctor', {
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
    name: 'profession',
  ),
  jsonField(
    'specialty',
    refer('DoctorSpecialty', 'doctor_specialty.dart'),
    name: 'specialite',
  ),
  jsonField(
    'acceptedDated',
    refer('DateTime'),
    name: 'acceptedDate',
  ),
});

final doctors = Root('doctor/', [
  doctorSpecialty,
  doctorJob,
  doctor,
  networkDoctor,
]);
