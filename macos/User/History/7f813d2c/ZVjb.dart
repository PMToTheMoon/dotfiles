import 'package:json_annotation/json_annotation.dart';

enum ConsultationStatus {
  @JsonValue('EN_ATTENTE_PAIEMENT')
  waitingPayment,

  @JsonValue('ECHEC_PAIEMENT')
  paymentFailed,

  @JsonValue('VALIDE')
  paymentValidated,

  @JsonValue('ANNULE')
  canceled,

  @JsonValue('PATIENT_ABSENT')
  patientMissing,

  @JsonValue('TERMINE')
  done,
}
