import 'package:bonemeal/bonemeal.dart';

class FormFieldMetaData {
  const FormFieldMetaData({
    required this.valueName,
    required this.valueType,
    required this.controllerType,
    required this.widgetDeclaration,
  });
  final String valueName;
  final String valueType;
  final String controllerType;
  final String widgetDeclaration;
}

/// Responsibility: generate form widget
abstract class FormField extends MetaObject<FormFieldMetaData> {
  const FormField(
    this.name,
  );

  final String name;
}
