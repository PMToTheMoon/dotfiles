import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_controller/form_controller.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class FormPartMetaData {
  const FormPartMetaData({
    required this.name,
    // required this.type,
    // required this.controller,
    required this.invokeWidget,
    required this.controllerFields,
  });

  final String name;
  // final Reference type;
  // final Reference controller;
  final Expression Function(Expression accessController) invokeWidget;
  final Iterable<FormControllerField> controllerFields;

  // Field toField() => Field((f) => f
  //   ..name = name
  //   ..type = type
  //   ..modifier = FieldModifier.final$);
}

abstract class FormPart extends MetaObject<FormPartMetaData> {}

abstract class FormPartWidget {
  Expression invokeWidget(Expression accessValue);
}

class FormField extends FormPart {
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
  final FormPartWidget widget;

  @override
  FormPartMetaData build(BuildStep step) {
    return FormPartMetaData(
      name: name,
      invokeWidget: (accessController) => widget.invokeWidget(
        controller.accessValue(accessController),
      ),
      controllerFields: [FormControllerField.fromFormField(this)],
    );
  }
}
