import 'package:bonemeal/bonemeal.dart';
import 'package:form_generator/form_generator.dart';

class FormFieldSeed<WidgetType, ValueType, ControllerType> {
  const FormFieldSeed({
    required this.invokeController,
    required this.accessData,
  });
  final ControllerType Function(ValueType) invokeController;
  final ValueType Function(ControllerType) accessData;

  // final dynamic Function(Map<String, Expression>) invokeWidget;
}

@FormFieldSeed<IntFormField, int, TextEditingController>(
  accessData: (TextEditingController c) => int.parse(c.text),
)
typedef TestFormField = _$TestFormField;
