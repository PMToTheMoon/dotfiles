import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_controller/form_controller.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.name,
    // required this.type,
    // required this.controller,
    required this.invokeWidget,
  });

  final String name;
  // final Reference type;
  // final Reference controller;
  final Expression invokeWidget;
  final List<FormControllerField> controllerFields;

  // Field toField() => Field((f) => f
  //   ..name = name
  //   ..type = type
  //   ..modifier = FieldModifier.final$);
}

abstract class FormPart extends MetaObject<FormFieldMetaData> {}

abstract class FormField extends FormPart {
  FormField({
    required this.name,
    required this.accessController,
    required this.controller,
    required this.widget,
  });

  final Expression accessController;
  final String name;
  // final Reference valueType;
  final FormFieldController controller;
  final FormFieldWidget widget;

  @override
  Iterable<FormControllerField> get controllerFields =>
      [FormControllerField.fromFormField(this)];

  @override
  FormFieldMetaData build(BuildStep step) {
    return FormFieldMetaData(
      name: name,
      invokeWidget: widget.invokeWidget(
        controller.accessValue(accessController),
      ),
    );
  }
}
