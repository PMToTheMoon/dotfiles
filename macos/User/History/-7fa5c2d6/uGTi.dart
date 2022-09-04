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
  final Reference type;
  final Reference controller;
  final Expression invokeWidget;
  final Expression invokeController;
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

  /// An expression that return the controller corresponding to the current field
  Reference get referController => refer('_controller.$name');

  /// The type of the data for the current field
  Reference get type;

  /// The controller type used by this field
  Reference get controller;

  /// instantiate a the form field widget
  Expression get invokeWidget;

  /// instantiate the controller
  Expression get invokeController;

  /// access the value from controller
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
