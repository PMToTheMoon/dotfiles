import 'package:bonemeal/bonemeal.dart';

import 'medical_context.dart';
import 'medical_informations_multi.dart';

final medicalInformationModels = Root('medical_informations', [
  medicalContext,
  medicalInformationMulti,
]);
