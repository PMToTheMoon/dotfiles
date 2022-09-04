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
  final Expression? validator;

  @override
  FormFieldMetaData build(BuildStep step) {
    final valueType = TypeReference((t) => t
      ..symbol = 'String'
      ..isNullable = false);

    final controller = TypeReference((t) => t
      ..symbol = 'TextEditingController'
      ..isNullable = false
      ..url = 'package:flutter/material.dart');

    final decorations = InvokeExpression.newOf(
      refer('InputDecoration'),
      [],
      {
        'errorMaxLines': literal(3),
        if (label != null) 'labelText': literal(label),
        if (hint != null) 'labelText': literal(hint),
      },
    );

    final widget = InvokeExpression.newOf(
      refer('TextFormField', 'package:flutter/material.dart'),
      [],
      {
        'controller': refer('_controller.$name'),
        'textInputAction': refer('TextInputAction.next'),
        if (validator != null) 'validator': validator!,
        'decoration': decorations,
      },
    );

    final invokeController = InvokeExpression.newOf(
      refer('TextEditingController', 'package:flutter/material.dart'),
      [],
      {
        'text': refer('initialValue?.$name'),
      },
    );

    return FormFieldMetaData(
      name: name,
      type: valueType,
      controller: controller,
      invokeWidget: widget,
      invokeController: invokeController,
      getValue: refer('$name.text'),
    );
  }
}
