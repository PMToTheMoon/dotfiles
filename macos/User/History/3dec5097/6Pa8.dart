import 'package:bonemeal/bonemeal.dart';

import 'consultation_bill.dart';
import 'consultation_type.dart';
import 'provider_consultation.dart';

final consultation = Root('consultations/', [
  consultationType,
  consultationBill,
  providerConsultation,
]);
