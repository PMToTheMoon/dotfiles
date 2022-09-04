import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'code_compose.dart';

Parameter namedParam(
  String name, {
  Reference? type,
  bool required = true,
  bool toThis = true,
}) =>
    param(
      name,
      type: type,
      required: required,
      named: true,
      toThis: toThis,
    );

Parameter param(
  String name, {
  Reference? type,
  bool required = true,
  bool named = false,
  bool toThis = true,
}) {
  assert(toThis == true || type != null,
      "You should provide a type for parameters that doesn't refer to this");
  return Parameter((p) => p
    ..name = name
    ..type = toThis ? null : type
    ..required = required && named
    ..named = named
    ..toThis = toThis);
}

extension CodeComposeParameterExtension on Parameter {
  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);

  Property toProp() => prop(name, type!);
}

class Parameters extends DelegatingSet<Parameter> {
  static const empty = Parameters({});

  const Parameters(super.base);

  Properties toProperties() => Properties(
        map((p) => p.toProp()).toSet(),
      );

  Iterable<Parameter> get allRequired => where((p) => p.named == false);
  Iterable<Parameter> get allOptional => where((p) => p.named == true);
}
