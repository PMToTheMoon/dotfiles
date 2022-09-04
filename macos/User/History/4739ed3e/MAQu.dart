import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class MultiLineFormFieldWidget extends FormPartWidget {
  MultiLineFormFieldWidget({
    required this.hint,
    this.validator,
    this.border = true,
  });

  final Expression hint;
  final Expression? validator;
  final bool border;

  @override
  Expression get widgetType =>
      refer('MultiLineTextFormField', 'package:common/common.dart');

  @override
  Map<String, Expression> defaultNamedParameters(Expression accessController) =>
      {
        ...defaultNamedParameters(accessController),
        // 'textInputAction': refer('TextInputAction.next'),
        'hint': hint,
        if (border != true) 'border': literal(border),
        if (validator != null) 'validator': validator!,
      };
}

class MultiLineFormFieldController extends TextFormFieldController {
  MultiLineFormField(
    super.name, {
    required this.hint,
    this.validator,
    this.border = true,
  });

  final Expression hint;
  final Expression? validator;
  final bool border;

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
  Expression accessValue(Expression controller) => controller.property('text');

  @override
  final type = TypeReference((t) => t
    ..symbol = 'String'
    ..isNullable = false);
}
