import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/src/form_controller/form_field_controller.dart';

class TextFieldController extends FormFieldController {
  TextFieldController() : super(refer('String'));

  @override
  Expression accessValue(Expression controller) => controller.property('text');

  @override
  Field fieldDeclaration(String fieldName) => field(
        fieldName,
        refer('TextEditingController', 'package:flutter/material.dart'),
      );

  @override
  Expression invokeController(Expression initialValue) => refer(
        'TextEditingController',
        'package:flutter/material.dart',
      ).newInstance([], {
        'text': initialValue,
      });
}
