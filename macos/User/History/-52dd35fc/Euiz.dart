import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.fields,
  });

  final String name;
  final List<FormField> fields;
  final FormPartWidget widget;

  @override
  FormPartMetaData build(BuildStep step) {
    return FormPartMetaData(
      name: name,
      invokeWidget: widget.invokeWidget(
        controller.accessValue(accessController),
      ),
      controllerFields: [FormControllerField.fromFormField(this)],
    );
  }
}
