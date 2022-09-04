import 'package:bonemeal/bonemeal.dart';

import 'consultations/consultations.dart';
import 'doctors.dart';
import 'establishment.dart';
import 'records/records.dart';

final models = Path('packages/models/lib/src/', [
  doctors,
  establishment,
  // providers,
  consultations,
  records,
]);
