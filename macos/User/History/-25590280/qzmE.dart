import 'package:json_annotation/json_annotation.dart';

part 'test_enum.g.dart';

@JsonEnum(alwaysCreate: true)
enum EnumTest {
  @JsonValue('renamed')
  field;
}

@SerializersFor([
  BuiltValue,
])
final Serializers serializers = _$serializers;

class EnumTestSerializer extends PrimitiveSerializer<EnumTest> {
  @override
  EnumTest deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    // TODO: implement deserialize
    throw UnimplementedError();
  }

  @override
  Object serialize(Serializers serializers, EnumTest object,
      {FullType specifiedType = FullType.unspecified}) {
    // TODO: implement serialize
    throw UnimplementedError();
  }

  @override
  // TODO: implement types
  Iterable<Type> get types => throw UnimplementedError();

  @override
  // TODO: implement wireName
  String get wireName => throw UnimplementedError();
}
