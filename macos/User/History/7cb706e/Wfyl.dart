import 'package:bonemeal/bonemeal.dart';

import 'medical_context.dart';
import 'medical_information_multi.dart';

final medicalInformationModels = Root('medical_information/', [
  medicalContext,
  medicalInformationMulti,
]);
