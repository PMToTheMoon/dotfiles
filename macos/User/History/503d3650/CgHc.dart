import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'code_compose.dart';

Parameter namedParam(
  String name, {
  Reference type,
  bool? required,
}) =>
    param(
      name,
      type: type,
      required: required,
      named: true,
    );

Parameter param(
  String name, {
  bool? required,
  Reference? type,
  bool named = false,
  bool toThis = true,
}) =>
    Parameter((p) => p
      ..name = name
      ..type = type
      ..required = required ?? named == true && type.isNullable == false
      ..named = named
      ..toThis = toThis);

extension CodeComposeParameterExtension on Parameter {
  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}

class Parameters extends DelegatingSet<Parameter> {
  static const empty = Parameters({});

  const Parameters(super.base);

  Iterable<Parameter> get allRequired => where((p) => p.named == false);
  Iterable<Parameter> get allOptional => where((p) => p.named == true);

  Fields toFields() => Fields({
        ...map((p) => p.toField()),
      });
}
