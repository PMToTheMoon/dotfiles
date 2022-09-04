import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class ChipEditorFormField extends FormField {
  const ChipEditorFormField(
    super.name, {
    this.label,
  });

  final String? label;

  @override
  FormFieldMetaData build(BuildStep context) {
    return FormFieldMetaData(
      valueName: name,
      valueType: 'Set<String>',
      controllerType: 'ChipEditingController',
      controllerInitialization:
          'ChipEditingController(value: initialValue?.$name)',
      accessDataFromController: 'value',
      widgetDeclaration: '''
ChipEditorFormField(
  controller: _controller.$name,
  label: $label,
)''',
    );
  }
}
