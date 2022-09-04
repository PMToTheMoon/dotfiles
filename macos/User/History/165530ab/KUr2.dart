import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const doubleFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
  inputActionType: InputAction.next,
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.allow(RegExp(r'[0-9|.]')),
  ],
{{# validator }}
  validator: {{ validator }},
{{/ validator }}
  decoration: InputDecoration(
    errorMaxLines: 3,
    {{ decorations }},
  ),
)''';

class DoubleFormField extends FormField {
  DoubleFormField(
    super.name, {
    this.label,
    this.hint,
    this.validator,
    this.nullable = true,
  });

  final String? label;
  final String? hint;
  final String? validator;
  final bool nullable;

  @override
  FormFieldMetaData build(BuildStep step) {
    final decorations = [
      if (label != null) 'labelText: $label',
      if (hint != null) 'labelText: $hint',
    ].join(',');

    final widget = renderTemplate(doubleFormFieldTemplate, step.uri, {
      'decorations': decorations.isEmpty ? null : decorations,
      'controller': name,
      'validator': validator,
    });

    return FormFieldMetaData(
      valueName: name,
      valueType: nullable ? 'double?' : 'double',
      controllerType: 'TextEditingController',
      widgetDeclaration: widget,
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name.toString(),)',
      accessDataFromController:
          nullable ? 'double.tryParse($name.text)' : 'double.parse($name.text)',
    );
  }
}
