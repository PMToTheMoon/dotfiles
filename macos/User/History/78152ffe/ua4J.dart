import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class MultiLineFormField extends FormField {
  MultiLineFormField(
    super.name, {
    required Expression hint,
    this.validator,
  });

  final Expression? hint;
  final Expression? validator;

  @override
  InvokeExpression get invokeWidget => InvokeExpression.newOf(
        refer('MultiLineTextFormField', 'package:common/common.dart'),
        [],
        {
          'controller': referController,
          'textInputAction': refer('TextInputAction.next'),
          'hint': hint!,
          if (validator != null) 'validator': validator!,
        },
      );

  @override
  final controller = TypeReference((t) => t
    ..symbol = 'TextEditingController'
    ..isNullable = false
    ..url = 'package:flutter/material.dart');

  @override
  InvokeExpression get invokeController => InvokeExpression.newOf(
        refer('TextEditingController', 'package:flutter/material.dart'),
        [],
        {
          'text': refer('initialValue?.$name'),
        },
      );

  @override
  Expression get getValue => refer('$name.text');

  @override
  final type = TypeReference((t) => t
    ..symbol = 'String'
    ..isNullable = false);
}
