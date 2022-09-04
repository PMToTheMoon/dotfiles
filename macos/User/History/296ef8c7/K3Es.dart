import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const textFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
  textInputAction: TextInputAction.next,
{{# validator }}
  validator: {{ validator }},
{{/ validator }}
  decoration: InputDecoration(
    errorMaxLines: 3,
    {{ decorations }},
  ),
)''';

class TextFormField extends FormField {
  TextFormField(
    super.name, {
    this.label,
    this.hint,
    this.validator,
  });

  final String? label;
  final String? hint;
  final String? validator;

  @override
  FormFieldMetaData build(BuildStep step) {
    final decorations = [
      if (label != null) 'labelText: $label',
      if (hint != null) 'labelText: $hint',
    ].join(',');

    final widget = renderTemplate(textFormFieldTemplate, step.uri, {
      'decorations': decorations.isEmpty ? null : decorations,
      'controller': name,
      'validator': validator,
    });

    return FormFieldMetaData(
      name: name,
      type: TypeReference((t) => t..symbol = 'String'),
      controllerType: 'TextEditingController',
      widgetDeclaration: widget,
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name,)',
      accessDataFromController: '$name.text',
    );
  }
}
