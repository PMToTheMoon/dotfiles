import 'package:bonemeal/bonemeal.dart';

Field jsonField(
  String name,
  Reference type, {
  Expression? defaultValue,
  bool? disallowNullValue,
  Expression? fromJson,
  bool? ignore,
  bool? includeIfNull,
  String? jsonName,
  Expression? readValue,
  bool? required,
  Expression? toJson,
  Expression? unknownEnumValue,
}) {
  final annotationParameters = {
    if (defaultValue != null) 'defaultValue': defaultValue,
    if (disallowNullValue != null)
      'disallowNullValue': literal(disallowNullValue),
    if (fromJson != null) 'fromJson': fromJson,
    if (ignore != null) 'ignore': literal(ignore),
    if (includeIfNull != null) 'includeIfNull': literal(includeIfNull),
    if (name != null) 'name': literal(name),
    if (readValue != null) 'readValue': readValue,
    if (required != null) 'required': literal(required),
    if (toJson != null) 'toJson': toJson,
    if (unknownEnumValue != null) 'unknownEnumValue': unknownEnumValue,
  };
  Expression? annotation = annotationParameters.isNotEmpty
      ? refer('@JsonKey').call([], annotationParameters)
      : null;
  return field(
    name,
    type,
    modifier: FieldModifier.final$,
    annotations: [annotation],
  );
}
