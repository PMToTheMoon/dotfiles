abstract class BuiltValue implements Built<BuiltValue, BuiltValueBuilder> {
  static Serializer<BuiltValue> get serializer => _builtValue;

  BuiltValue._();

  factory BuiltValue([updates(BuiltValueBuilder b)]) = _$BuiltValue;

  @BuiltValueField(wireName: 'enumField')
  EnumTest get enumField;

  String toJson() => serializers.toJson(BuiltValue.serializer, this);

  factory BuiltValue.fromJson(String jsonString) =>
      serializers.fromJson(BuiltValue.serializer, jsonString)!;
}

void main() {}
