import 'package:bonemeal/bonemeal.dart';

Expression jsonKey({
  Expression? defaultValue,
  bool? disallowNullValue,
  Expression? fromJson,
  bool? ignore,
  bool? includeIfNull,
  String? name,
  Expression? readValue,
  bool? required,
  Expression? toJson,
  Expression? unknownEnumValue,

})

Field jsonField(
  String fieldName,
  Reference type, {
  Expression? defaultValue,
  bool? disallowNullValue,
  Expression? fromJson,
  bool? ignore,
  bool? includeIfNull,
  String? name,
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
      ? refer(
          'JsonKey',
          'package:json_annotation/json_annotation.dart',
        ).call([], annotationParameters)
      : null;
  return field(
    fieldName,
    type,
    modifier: FieldModifier.final$,
    annotations: annotation != null ? [annotation] : [],
  );
}
