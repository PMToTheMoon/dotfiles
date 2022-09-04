import 'package:code_builder/code_builder.dart';

extension CodeComposeParameterExtension on Parameter {
  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}
