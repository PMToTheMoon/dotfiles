import 'package:bonemeal/bonemeal.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.name,
    required this.type,
    required this.controller,
    required this.invokeWidget,
    required this.invokeController,
    required this.getValue,
  });

  final String name;
  final TypeReference type;
  final TypeReference controller;
  final InvokeExpression invokeWidget;
  final InvokeExpression invokeController;
  final Expression getValue;

  Field toField() => Field((f) => f
    ..name = name
    ..type = type
    ..modifier = FieldModifier.final$);
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject<FormFieldMetaData> {
  FormField(
    String name,
  ) : name = name.camelCase;

  final String name;

  Reference get referToController => refer('_controller.$name');

  TypeReference get type;

  TypeReference get controller;

  InvokeExpression get invokeWidget;

  InvokeExpression get invokeController;

  Expression get value;

  @override
  FormFieldMetaData build(BuildStep step) {
    final valueType = TypeReference((t) => t
      ..symbol = 'String'
      ..isNullable = false);

    return FormFieldMetaData(
      name: name,
      type: valueType,
      controller: controller(),
      invokeWidget: widget(),
      invokeController: invokeController(),
      getValue: refer('$name.text'),
    );
  }
}
