import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const intFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
  textInputAction: TextInputAction.next,
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

class IntFormField extends TextFormField {
  IntFormField(
    super.name, {
    super.label,
    super.hint,
    super.validator,
    this.nullable = true,
  }) : super();

  final bool nullable;

  @override
  TypeReference get type => TypeReference((t) => t
    ..symbol = 'int'
    ..isNullable = nullable);

  @override
  InvokeExpression get invokeController => InvokeExpression.newOf(
        refer('TextEditingController', 'package:flutter/material.dart'),
        [],
        {
          'text': refer('initialValue?.$name.toString()'),
        },
      );

  @override
  Expression get getValue => refer('$name.text');
}

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
  final type = TypeReference((t) => t
    ..symbol = 'int'
    ..isNullable = nullable);

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
      accessDataFromController:
          nullable ? 'int.tryParse($name.text)' : 'int.parse($name.text)',
    );
  }
}
