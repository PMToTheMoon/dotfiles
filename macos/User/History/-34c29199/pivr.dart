import 'package:bonemeal/bonemeal.dart';

import 'medical_informations/mdecials_informations.dart';
import 'record.dart';
import 'record_comlement.dart';

final records = Path('records/', [
  Path('record/', [
    medicalInformationModels,
    recordComplement,
    record,
  ]),
]);
