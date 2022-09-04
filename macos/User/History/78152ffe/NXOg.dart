import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const textFormFieldTemplate = '''
MultiLineFormField(
  controller: _controller.{{ controller }},
{{# decorations }}
  decoration: InputDecoration({{ decorations }}),
{{/ decorations }}
)''';

class TextFormField extends FormField {
  const TextFormField(
    super.name, {
    this.label,
    this.hint,
  });

  final String? label;
  final String? hint;

  @override
  FormFieldMetaData build(BuildStep context) {
    final decorations = [
      if (label != null) 'labelText: $label',
      if (hint != null) 'labelText: $hint',
    ].join(',');

    final widget = renderTemplate(textFormFieldTemplate, context.uri, {
      'decorations': decorations.isEmpty ? null : decorations,
      'controller': name,
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
