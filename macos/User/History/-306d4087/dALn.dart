import 'package:form_generator/form_generator.dart';

class ChipEditorFormField extends FormField {
  ChipEditorFormField(
    super.name, {
    required this.label,
  });

  final String label;
}
