import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class IntFormField extends TextFormField {
  IntFormField(
    super.name, {
    super.label,
    super.hint,
    super.validator,
    this.nullable = true,
  }) : super(parameters: {
          'keyboardType': refer('TextInputType.number'),
          'inputFormatters': refer(
              '<TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]',
              'package:flutter/services.dart'),
        });

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
  Expression get getValue =>
      refer(nullable ? 'int.tryParse($name.text)' : 'int.parse($name.text)');
}
