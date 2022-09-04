import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const intFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ],
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

    final widget = renderTemplate(intFormFieldTemplate, step.uri, {
      'decorations': decorations.isEmpty ? null : decorations,
      'controller': name,
    });

    return FormFieldMetaData(
      valueName: name,
      valueType: 'int',
      controllerType: 'TextEditingController',
      widgetDeclaration: widget,
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name.toString())',
      accessDataFromController: 'int.parse($name.text)',
    );
  }
}
