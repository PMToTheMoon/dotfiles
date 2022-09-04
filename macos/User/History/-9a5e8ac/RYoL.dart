import 'package:bonemeal/bonemeal.dart';

import 'base_record.dart';
import 'medical_informations/mdecials_informations.dart';
import 'rapports/rapport_multi.dart';
import 'rapports/rapports.dart';
import 'record.dart';
import 'record_comlement.dart';

final records = Path('records/', [
  Path('record_view', [
    CspUserRecordViewChildRecord(),
  ]),
  Path('record/', [
    Path('rapports/', [
      rapportGeneral,
    ]),
    Path('medical_information/', [
      medicalContext,
      medicalInformationGeneral,
    ]),
    recordComplement,
    record,
  ]),
]);
