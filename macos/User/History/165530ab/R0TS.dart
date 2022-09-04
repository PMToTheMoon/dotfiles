import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

const doubleFormFieldTemplate = '''
TextFormField(
  controller: _controller.{{ controller }},
  textInputAction: TextInputAction.next,
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
    super.label,
    super.hint,
    super.validator,
    this.nullable = true,
  }) : super(parameters: {
          'keyboardType': refer('TextInputType.number'),
          'inputFormatters': refer(
            '<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]',
          ),
        });

  final bool nullable;

  @override
  TypeReference get type => TypeReference((t) => t
    ..symbol = 'double'
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
  Expression get getValue => refer(
      nullable ? 'double.tryParse($name.text)' : 'double.parse($name.text)');
}
