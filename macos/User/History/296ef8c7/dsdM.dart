import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

class TextFormField extends FormField {
  TextFormField(
    super.name, {
    this.label,
    this.hint,
    this.validator,
    this.decorations = const {},
  });

  final String? label;
  final String? hint;
  final Expression? validator;
  final Map<String, Expression> decorations;

  @override
  final type = TypeReference((t) => t
    ..symbol = 'String'
    ..isNullable = false);

  @override
  final controller = TypeReference((t) => t
    ..symbol = 'TextEditingController'
    ..isNullable = false
    ..url = 'package:flutter/material.dart');

  Expression get inputDecorations => InvokeExpression.newOf(
        refer('InputDecoration'),
        [],
        {
          'errorMaxLines': literal(3),
          if (label != null) 'labelText': literal(label),
          if (hint != null) 'labelText': literal(hint),
          ...decorations,
        },
      );

  @override
  InvokeExpression get invokeWidget => InvokeExpression.newOf(
        refer(
          'TextFormField',
          'package:flutter/material.dart',
        ),
        [],
        {
          'controller': referController,
          'textInputAction': refer('TextInputAction.next'),
          if (validator != null) 'validator': validator!,
          'decoration': inputDecorations,
        },
      );

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
}
