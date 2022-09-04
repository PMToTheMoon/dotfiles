import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'test_enum.dart';

part 'test.g.dart';

abstract class BuiltValue implements Built<BuiltValue, BuiltValueBuilder> {
  static Serializer<BuiltValue> get serializer => _$builtValueSerializer;

  BuiltValue._();

  factory BuiltValue([updates(BuiltValueBuilder b)]) = _$BuiltValue;

  @BuiltValueField(wireName: 'enumField')
  EnumTest get enumField;

  String toJson() => serializers.toJson(BuiltValue.serializer, this);

  factory BuiltValue.fromJson(String jsonString) =>
      serializers.fromJson(BuiltValue.serializer, jsonString)!;
}

@SerializersFor([
  BuiltValue,
])
final Serializers serializers = _$serializers;

class EnumTestSerializer extends PrimitiveSerializer<EnumTest> {}

void main() {
  final v = BuiltValue((b) => b..enumField = EnumTest.field);
  print(v.toJson());
}
