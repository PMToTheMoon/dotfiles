import 'package:built_value/built_value.dart';

export enum EnumRdvStatut {
    EN_ATTENTE_PAIEMENT = 'EN_ATTENTE_PAIEMENT',
    ECHEC_PAIEMENT = 'ECHEC_PAIEMENT',
    VALIDE = 'VALIDE',
    ANNULE = 'ANNULE',
    PATIENT_ABSENT = 'PATIENT_ABSENT',
    TERMINE = 'TERMINE'
}

@BuiltValueEnum(wireName: 'EnumRdvStatut')
class EnumRdvStatus extends EnumClass {
static Serializer<EnumRdvStatus> get serializer => _$enumRdvStatus;

@BuiltValueEnumConst(wireName: 'value')
static const EnumRdvStatus value = _value;

static BuiltSet<EnumRdvStatus> get values => _$enumRdvStatusValues;
static EnumRdvStatus valueOf(String name) => _$enumRdvStatusValueOf(name);
}