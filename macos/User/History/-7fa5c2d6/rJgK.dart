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

  Expression get referController => refer('_controller.$name');

  Expression get type;

  Expression get controller;

  Expression get invokeWidget;

  Expression get invokeController;

  Expression get getValue;

  @override
  FormFieldMetaData build(BuildStep step) {
    return FormFieldMetaData(
      name: name,
      type: type,
      controller: controller,
      invokeWidget: invokeWidget,
      invokeController: invokeController,
      getValue: getValue,
    );
  }
}
