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

abstract class RootDto implements Built<RootDto, RootDtoBuilder> {
  static Serializer<RootDto> get serializer => _$rootDtoSerializer;

  RootDto._();

  factory RootDto([updates(RootDtoBuilder b)]) = _$RootDto;

  @BuiltValueField(wireName: 'id')
  int get id;

  String toJson() {
    return json.encode(serializers.serializeWith(RootDto.serializer, this));
  }

  static RootDto fromJson(String jsonString) {
    return serializers.deserializeWith(
        RootDto.serializer, json.decode(jsonString));
  }
}
