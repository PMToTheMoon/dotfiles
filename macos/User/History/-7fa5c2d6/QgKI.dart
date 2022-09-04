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
  final String valueName;
  final String valueType;
  final String controllerType;
  final String widgetDeclaration;
  final String controllerInitialization;
  final String accessDataFromController;
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject<FormFieldMetaData> {
  const FormField(
    this.name,
  );

  final String name;

  String get controllerName => '${name}Controller';
}
