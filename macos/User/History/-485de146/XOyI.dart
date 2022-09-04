import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const multiLineFormFieldTemplate = '''
MultiLineTextFormField(
  controller: _controller.{{ controller }},
  hint: {{ hint }},
)''';

class MultiLineFormField extends FormField {
  const MultiLineFormField(
    super.name, {
    this.hint,
  });

  final String? hint;

  @override
  FormFieldMetaData build(BuildStep context) {
    return FormFieldMetaData(
      valueName: name,
      valueType: 'String',
      controllerType: 'TextEditingController',
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name)',
      accessDataFromController: 'text',
      widgetDeclaration: '''

''',
    );
  }
}
