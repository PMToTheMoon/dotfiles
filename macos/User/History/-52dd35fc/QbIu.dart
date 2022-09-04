import 'package:form_generator/form_generator.dart';

abstract class FormSection extends FormPart {
  FormSection({
    required this.fields,
  });

  final List<FormField> fields;

  @override
  Iterable<FormControllerField> get controllerFields =>
      fields.expand((f) => f.controllerFields);
}
