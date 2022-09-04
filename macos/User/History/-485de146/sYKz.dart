import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const multiLineFormFieldTemplate = '''
ChipEditorFormField(
  controller: _controller.{{ controller }},
  label: {{ label }},
)''';

class MultiLineFormField extends FormField {
  const MultiLineFormField(
    super.name, {
    this.label,
  });

  final String? label;

  @override
  FormFieldMetaData build(BuildStep context) {
    return FormFieldMetaData(
      valueName: name,
      valueType: 'Set<String>',
      controllerType: 'ChipEditorController',
      controllerInitialization:
          'ChipEditingController(value: initialValue?.$name)',
      accessDataFromController: 'value',
      widgetDeclaration: '''

''',
    );
  }
}
