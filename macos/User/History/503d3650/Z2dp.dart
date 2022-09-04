import 'package:code_builder/code_builder.dart';

Parameter param(String name, Reference type) => Parameter((p) => p
  ..name = name
  ..type = type);

extension CodeComposeParameterExtension on Parameter {
  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}
