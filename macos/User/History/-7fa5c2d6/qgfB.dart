import 'package:bonemeal/bonemeal.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.valueName,
    required this.valueType,
    required this.controllerType,
  });
  final String valueName;
  final String valueType;
  final String controllerType;
  final String widget;
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject<FormFieldMetaData> {}
