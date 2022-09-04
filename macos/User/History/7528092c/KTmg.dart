// abstract class ConsultationType {
//     identifiant: number;
//     int get id;
//     libelleFR: string;
// }

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'consultation_type.g.dart';

abstract class ConsultationType
    implements Built<ConsultationType, ConsultationTypeBuilder> {
  static Serializer<ConsultationType> get serializer => _consultationType;

  ConsultationType._();

  @BuiltValueField(wireName: 'identifiant')
  int get id;

  @BuiltValueField(wireName: 'libelleFr')
  String get displayFr;

  factory ConsultationType([updates(ConsultationTypeBuilder b)]) =
      _$ConsultationType;

  String toJson() => serializers.toJson(ConsultationType.serializer, this);

  factory ConsultationType.fromJson(String jsonString) =>
      serializers.fromJson(ConsultationType.serializer, jsonString)!;
}
