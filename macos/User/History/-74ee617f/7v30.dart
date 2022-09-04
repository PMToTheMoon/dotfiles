import 'package:bonemeal/bonemeal.dart';

final hiddenReasonValidator = refer('''
(value) {
  if (value?.isNotEmpty == true) return null;
  if (_controller.patientReason.text.isNotEmpty == true) {
    return null;
  }
  return context.l10n.hidden_observation_error;
}''');

final patientReasonValidator = refer('''
(value) {
  if (value?.isNotEmpty == true) return null;
  if (_controller.hiddenReason.text.isNotEmpty == true) {
    return null;
  }
  return context.l10n.patient_observation_error;
}''');
