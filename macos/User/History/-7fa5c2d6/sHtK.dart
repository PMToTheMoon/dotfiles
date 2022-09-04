import 'package:bonemeal/bonemeal.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.valueName,
    required this.valueType,
    required this.controllerType,
    required this.widgetDeclaration,
    required this.controllerInitialization,
    required this.accessDataFromController,
  });

  final TypeReference value;
  final TypeReference controller;
  final String widgetDeclaration;
  final String controllerInitialization;
  final String accessDataFromController;
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject<FormFieldMetaData> {
  FormField(
    String name,
  ) : name = name.camelCase;

  final String name;
}
