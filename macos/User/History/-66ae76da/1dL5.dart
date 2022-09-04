import 'package:bonemeal/bonemeal.dart';

Field jsonField({
  Object? defaultValue,
  bool? disallowNullValue,
  Function? fromJson,
  bool? ignore,
  bool? includeIfNull,
  String? name,
  Object? readValue(Map, String)?,
  bool? required,
  Function? toJson,
  Enum? unknownEnumValue,
}) {
  final annotationParameters = [
    defaultValue,
    disallowNullValue,
    fromJson,
    ignore,
    includeIfNull,
    name,
    readValue,
    required,
    toJson,
    unknownEnumValue,
  ];
  refer('@JsonKey').call([], {
    if(defaultValue != null) 'defaultValue': defaultValue,
if(disallowNullValue != null) 'disallowNullValue': disallowNullValue,
if(fromJson != null) 'fromJson': fromJson,
if(ignore != null) 'ignore': ignore,
if(includeIfNull != null) 'includeIfNull': includeIfNull,
if(name != null) 'name': name,
if(readValue != null) 'readValue': readValue,
if(required != null) 'required': required,
if(toJson != null) 'toJson': toJson,
if(unknownEnumValue != null) 'unknownEnumValue': unknownEnumValue,
  })
}
