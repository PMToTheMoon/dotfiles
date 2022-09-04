import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_controller/form_controller.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class FormPartMetaData {
  const FormPartMetaData({
    required this.name,
    required this.invokeWidget,
    required this.controllerFields,
  });

  final String name;
  final Expression Function(Expression accessController) invokeWidget;
  final Iterable<FormControllerField> controllerFields;
}

abstract class FormPartWidget {
  Expression invokeWidget(Expression accessController);
}

abstract class FormPart extends MetaObject<FormPartMetaData> {}

class FormField extends FormPart {
  FormField({
    required this.name,
    required this.controller,
    required this.widget,
  });

  final String name;
  final FormFieldController controller;
  final FormPartWidget widget;

  @override
  String get path => '';

  @override
  FormPartMetaData build(BuildStep step) {
    return FormPartMetaData(
      name: name,
      invokeWidget: widget.invokeWidget,
      controllerFields: [FormControllerField.fromFormField(this)],
    );
  }
}
