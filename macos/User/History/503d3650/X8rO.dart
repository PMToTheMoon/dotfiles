import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'code_compose.dart';

Parameter param(String name, Reference type) => Parameter((p) => p
  ..name = name
  ..type = type);

extension CodeComposeParameterExtension on Parameter {
  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}

class Parameters extends DelegatingSet<Parameter> {
  static const empty = Parameters({});

  const Parameters(super.base);

  Fields toFields() => Fields({
        ...map((p) => p.toField()),
      });
}
