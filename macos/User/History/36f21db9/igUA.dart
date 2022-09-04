import 'package:bonemeal/bonemeal.dart';

import 'medical_context.dart';
import 'medical_information_general.dart';

final medicalInformationModels = Root('medical_information/', [
  medicalContext,
  medicalInformationGeneral,
]);
