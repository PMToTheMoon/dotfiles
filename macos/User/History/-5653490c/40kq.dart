import 'package:built_value/built_value.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum EnumRdvStatut {
  @JsonValue('EN_ATTENTE_PAIEMENT')
    EN_ATTENTE_PAIEMENT,
    
    @JsonValue('ECHEC_PAIEMENT')
    ECHEC_PAIEMENT,
    
    @JsonValue('VALIDE')
    VALIDE,

    @JsonValue('ANNULE'
    ANNULE = 'ANNULE',
    @JsonValue('
    PATIENT_ABSENT = 'PATIENT_ABSENT',
    @JsonValue('
    TERMINE = 'TERMINE',
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