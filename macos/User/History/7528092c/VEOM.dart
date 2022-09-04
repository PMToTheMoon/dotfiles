// abstract class ConsultationType {
//     identifiant: number;
//     int get id;
//     libelleFR: string;
// }

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'root_dto.g.dart';

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

abstract class RootDto implements Built<RootDto, RootDtoBuilder> {
  static Serializer<RootDto> get serializer => _$rootDtoSerializer;

  RootDto._();

  factory RootDto([updates(RootDtoBuilder b)]) = _$RootDto;

  @BuiltValueField(wireName: 'id')
  int get id;

  String toJson() => serializers.toJson(RootDto.serializer, this);

  factory RootDto.fromJson(String jsonString) => serializers.fromJson(
        RootDto.serializer, jsonString,);
}
