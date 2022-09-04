import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const multiLineFormFieldTemplate = '''
MultiLineTextFormField(
  controller: _controller.{{ controller }},
  hint: {{ hint }},
  {{# validator }}
    {{ validator }},
  {{/ validator }}
)''';

class MultiLineFormField extends FormField {
  MultiLineFormField(
    super.name, {
    this.hint,
    this.validator,
  });

  final String? hint;
  final String? validator;

  @override
  FormFieldMetaData build(BuildStep context) {
    final widget = renderTemplate(multiLineFormFieldTemplate, context.uri, {
      'controller': name,
      'hint': hint,
      'validator': validator,
    });

    return FormFieldMetaData(
      valueName: name,
      valueType: 'String',
      controllerType: 'TextEditingController',
      widgetDeclaration: widget,
      controllerInitialization:
          'TextEditingController(text: initialValue?.$name)',
      accessDataFromController: '$name.text',
    );
  }
}
