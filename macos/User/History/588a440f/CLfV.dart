import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

abstract class FormField extends FormPart {
  FormField(
    this.name,
  );

  final String name;

  FormFieldController get controller;
  FormPartWidget get widget;

  @override
  String get path => '';

  @override
  FormPartMetaData build(BuildStep step) {
    return FormPartMetaData(
      widgetInvocations: (Expression controller) =>
          widget.invokeWidgets(controller.property(name)),
      controllerFields: [FormControllerField.fromFormField(this)],
    );
  }
}
