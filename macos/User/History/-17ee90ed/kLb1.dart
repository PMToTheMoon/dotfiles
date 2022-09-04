import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const textFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
{{# decorations }}
  decoration: InputDecoration({{ decorations }}),
{{/ decorations }}
)''';

class IntFormField extends FormField {
  const IntFormField(
    super.name, {
    this.label,
    this.hint,
  });

  final String? label;
  final String? hint;

  @override
  FormFieldMetaData build(BuildStep step) {
    final decorations = [
      if (label != null) 'labelText: $label',
      if (hint != null) 'labelText: $hint',
    ].join(',');

    final widget = renderTemplate(textFormFieldTemplate, step.uri, {
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
