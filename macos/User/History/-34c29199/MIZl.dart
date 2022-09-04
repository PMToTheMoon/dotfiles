import 'package:bonemeal/bonemeal.dart';

import 'consultation_bill.dart';
import 'consultation_type.dart';
import 'provider_consultation.dart';
import 'record.dart';

final records = Root('records/', [
  Root('record/', [
    consultationType,
    consultationBill,
    providerConsultation,
    record,
  ]),
]);
