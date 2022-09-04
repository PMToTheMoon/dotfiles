import 'dart:async';

import 'package:bonemeal/bonemeal.dart';

part 'form_field_input.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.valueName,
    required this.valueType,
    required this.controllerType,
  });
  final String valueName;
  final String valueType;
  final String controllerType;
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject {}
