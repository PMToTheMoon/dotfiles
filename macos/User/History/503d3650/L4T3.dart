import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'code_compose.dart';

Parameter param(
  String name,
  Reference type, {
  bool required = false,
  bool named = true,
}) =>
    Parameter((p) => p
      ..name = name
      ..type = type
      ..required = required
      ..named = named);

extension CodeComposeParameterExtension on Parameter {
  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}

class Parameters extends DelegatingSet<Parameter> {
  static const empty = Parameters({});

  const Parameters(super.base);

  Iterable<Parameter> get allRequired => where((p) => p.required == true);
  Iterable<Parameter> get allOptional => where((p) => p.required == false);

  Fields toFields() => Fields({
        ...map((p) => p.toField()),
      });
}
