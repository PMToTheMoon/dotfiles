import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class MultiLineFormField extends FormField {
  MultiLineFormField(
    super.name, {
    required Expression hint,
    super.validator,
  });

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
  Reference get controller => throw UnimplementedError();

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
  // TODO: implement type
  Reference get type => throw UnimplementedError();
}
