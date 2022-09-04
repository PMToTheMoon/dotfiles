import 'package:bonemeal/bonemeal.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.value,
    required this.controller,
    required this.invokeWidget,
    required this.invokeController,
    required this.accessDataFromController,
  });

  final TypeReference value;
  final TypeReference controller;
  final InvokeExpression invokeWidget;
  final InvokeExpression invokeController;
  final Expression accessDataFromController;
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject<FormFieldMetaData> {
  FormField(
    String name,
  ) : name = name.camelCase;

  final String name;
}