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

  @override
  final type = TypeReference((t) => t
    ..symbol = 'String'
    ..isNullable = false);

  @override
  final controller = TypeReference((t) => t
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

  Reference get widgetType => refer(
        'TextFormField',
        'package:flutter/material.dart',
      );

  InvokeExpression widget() => InvokeExpression.newOf(
        widgetType,
        [],
        {
          'controller': refer('_controller.$name'),
          'textInputAction': refer('TextInputAction.next'),
          if (validator != null) 'validator': validator!,
          'decoration': decorations(),
        },
      );

  InvokeExpression invokeController() => InvokeExpression.newOf(
        refer('TextEditingController', 'package:flutter/material.dart'),
        [],
        {
          'text': refer('initialValue?.$name'),
        },
      );

  @override
  FormFieldMetaData build(BuildStep step) {
    return FormFieldMetaData(
      name: name,
      type: valueType,
      controller: controller(),
      invokeWidget: widget(),
      invokeController: invokeController(),
      getValue: refer('$name.text'),
    );
  }
}
