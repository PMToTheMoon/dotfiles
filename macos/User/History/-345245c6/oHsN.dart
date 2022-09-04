import 'package:bonemeal/bonemeal.dart';
import 'package:code_builder/src/specs/field.dart';
import 'package:code_builder/src/specs/expression.dart';
import 'package:form_generator/form_generator.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class TextFieldController extends FormFieldController {
  TextFieldController(
    super.fieldName, {
    required super.controller,
    required super.getValue,
  }) : super();

  @override
  Expression accessValue(Expression controller) {
    return controller.property('text');
  }

  @override
  Field fieldDeclaration(String fieldName) {
    return field(
      fieldName,
      refer('TextEditingController', 'package:flutter/material.dart'),
    );
  }

  @override
  Expression invokeController(Expression initialValue) {
    return refer('TextEditingController', 'package:flutter/material.dart')
        .newInstance(
      [],
      {
        'text': initialValue,
      },
    );
  }
}
