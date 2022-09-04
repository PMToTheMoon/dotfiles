import 'form_part.dart';

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
