import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum EnumRdvStatut {
  @JsonValue('EN_ATTENTE_PAIEMENT')
  waitingPayment,

  @JsonValue('ECHEC_PAIEMENT')
  paymentFailed,

  @JsonValue('VALIDE')
  validated,

  @JsonValue('ANNULE')
  canceled,

  @JsonValue('PATIENT_ABSENT')
  missingPatient,

  @JsonValue('TERMINE')
  done,
}

// @BuiltValueEnum(wireName: 'EnumRdvStatut')
// class ConsultationStatus extends EnumClass {
// static Serializer<ConsultationStatus> get serializer => _$EnumRdvStatutSerializer;

// @BuiltValueEnumConst(wireName: 'EN_ATTENTE_PAIEMENT')
// static const ConsultationStatus waitingPayment = _waitingPayment;

// @BuiltValueEnumConst(wireName: 'ECHEC_PAIEMENT')
// static const ConsultationStatus waitingPayment = _waitingPayment;

// static BuiltSet<ConsultationStatus> get values => _$EnumRdvStatutValues;
// static ConsultationStatus valueOf(String name) => _$EnumRdvStatutValueOf(name);
// }