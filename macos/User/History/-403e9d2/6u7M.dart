import 'package:bonemeal/bonemeal.dart';
import 'package:flutter/material.dart';
import 'package:form_generator/form_generator.dart';

class TbtTextFieldController extends TextFormFieldWidget {
  @override
  Expression get widgetType =>
      refer('TbtTextFormField', 'package:common/common.dart');
}
