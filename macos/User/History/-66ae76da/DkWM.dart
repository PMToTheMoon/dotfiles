import 'package:bonemeal/bonemeal.dart';

Field jsonField({
  Expression? defaultValue,
  bool? disallowNullValue,
  Expression? fromJson,
  bool? ignore,
  bool? includeIfNull,
  String? name,
  Expression? readValue,
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
    if (defaultValue != null) 'defaultValue': defaultValue,
    if (disallowNullValue != null)
      'disallowNullValue': literal(disallowNullValue),
    if (fromJson != null) 'fromJson': fromJson,
    if (ignore != null) 'ignore': literal(ignore),
    if (includeIfNull != null) 'includeIfNull': literal(includeIfNull),
    if (name != null) 'name': literal(name),
    if (readValue != null) 'readValue': readValue,
    if (required != null) 'required': required,
    if (toJson != null) 'toJson': toJson,
    if (unknownEnumValue != null) 'unknownEnumValue': unknownEnumValue,
  });
}
