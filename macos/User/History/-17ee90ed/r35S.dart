import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const intFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
  keyboardType: TextInputType.number,
  inputFormatters: <TextInputFormatter>[
    FilteringTextInputFormatter.digitsOnly
  ],
{{# validator }}
  validator: {{ validator }},
{{/ validator }}
  decoration: InputDecoration(
    errorMaxLines: 3,
    {{ decorations }},
  ),
)''';

class IntFormField extends FormField {
  IntFormField(
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

    final widget = renderTemplate(intFormFieldTemplate, step.uri, {
      'decorations': decorations.isEmpty ? null : decorations,
      'controller': name,
      'validator': validator,
    });

    return FormFieldMetaData(
      valueName: name,
      valueType: nullable ? 'int?' : 'int',
      controllerType: 'TextEditingController',
      widgetDeclaration: widget,
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name.toString(),)',
      accessDataFromController: 'int.tryParse($name.text)',
    );
  }
}
