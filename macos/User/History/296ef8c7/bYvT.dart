import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_fields/form_field.dart';

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

  TypeReference controller() => TypeReference((t) => t
    ..symbol = 'TextEditingController'
    ..isNullable = false
    ..url = 'package:flutter/material.dart');

  Expression decorations() => InvokeExpression.newOf(
        refer('InputDecoration'),
        [],
        {
          'errorMaxLines': literal(3),
          if (label != null) 'labelText': literal(label),
          if (hint != null) 'labelText': literal(hint),
        },
      );

  InvokeExpression widget() => InvokeExpression.newOf(
        refer('TextFormField', 'package:flutter/material.dart'),
        [],
        {
          'controller': refer('_controller.$name'),
          'textInputAction': refer('TextInputAction.next'),
          if (validator != null) 'validator': validator!,
          'decoration': decorations(),
        },
      );

  @override
  FormFieldMetaData build(BuildStep step) {
    final valueType = TypeReference((t) => t
      ..symbol = 'String'
      ..isNullable = false);

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
      controller: controller(),
      invokeWidget: widget(),
      invokeController: invokeController,
      getValue: refer('$name.text'),
    );
  }
}
