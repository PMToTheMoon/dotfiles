import 'package:built_value/serializer.dart';

part 'built_value_serializer.g.dart';

@SerializersFor([
  Account,
  Cat,
  CompoundValue,
  Fish,
  GenericValue,
  SimpleValue,
  VerySimpleValue,
])
final Serializers serializers = _$serializer