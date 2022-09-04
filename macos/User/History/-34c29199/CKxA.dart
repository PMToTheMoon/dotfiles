import 'package:bonemeal/bonemeal.dart';

import 'medical_informations/mdecials_informations.dart';
import 'record.dart';
import 'record_comlement.dart';

final records = Root('records/', [
  Root('record/', [
    medicalInformationModels,
    recordComplement,
    record,
  ]),
]);
