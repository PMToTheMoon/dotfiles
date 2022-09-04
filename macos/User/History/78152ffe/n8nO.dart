import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

const multiLineFormFieldTemplate = '''
MultiLineTextFormField(
  controller: _controller.{{ controller }},
  textInputAction: TextInputAction.next,
  hint: {{ hint }},
  {{# validator }}
    validator: {{ validator }},
  {{/ validator }}
)''';

class MultiLineFormField extends TextFormField {
  MultiLineFormField(
    super.name, {
    super.hint,
    super.validator,
  });

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
