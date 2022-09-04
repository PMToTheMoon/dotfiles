import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class FormField extends FormPart {
  FormField({
    required this.name,
    required this.controller,
    required this.widget,
  });

  final String name;
  final FormPartController controller;
  final FormPartWidget widget;

  @override
  String get path => '';

  @override
  FormPartMetaData build(BuildStep step) {
    return FormPartMetaData(
      invokeWidget: (Expression controller) =>
          widget.invokeWidget(controller.property(name)),
      controllerFields: [FormControllerField.fromFormField(this)],
    );
  }
}
