import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final doctorSpecialty = JsonSerializable('DoctorSpecialty', {
  jsonField('id', refer('int'), name: 'identifiant'),
  jsonField('displayFr', refer('String'), name: 'libelleFR'),
});

final doctorJob = JsonSerializable('DoctorJob', {
  jsonField('id', refer('int'), name: 'identifiant'),
  jsonField('displayFr', refer('String'), name: 'libelleFR'),
});

final doctorFields = {
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
    refer('DoctorJob?', 'doctor_job.dart'),
    name: 'profession',
  ),
  jsonField(
    'specialty',
    refer('DoctorSpecialty?', 'doctor_specialty.dart'),
    name: 'specialite',
  ),
};
final doctor = Freezed(
  className: 'Doctor',
  serializable: true,
  types: {
    '': doctorFields,
  },
);

final networkDoctor = JsonSerializable('NetworkDoctor', {
  ...doctorFields,
  jsonField(
    'acceptedDate',
    refer('int?'),
  ),
});

final doctors = Path('doctor/', [
  doctorSpecialty,
  doctorJob,
  doctor,
  networkDoctor,
]);
