import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const multiLineFormFieldTemplate = '''
MultiLineFormField(
  controller: _controller.{{ controller }},
  hint: {{ hint }},
)''';

class TextFormField extends FormField {
  const TextFormField(
    super.name, {
    this.hint,
  });

  final String? hint;

  @override
  FormFieldMetaData build(BuildStep context) {
    final widget = renderTemplate(multiLineFormFieldTemplate, context.uri, {
      'controller': name,
      'hint': hint,
    });

    return FormFieldMetaData(
      valueName: name,
      valueType: 'String',
      controllerType: 'TextEditingController',
      widgetDeclaration: widget,
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name)',
      accessDataFromController: 'text',
    );
  }
}
