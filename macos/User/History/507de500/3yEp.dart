import 'package:bonemeal/bonemeal.dart';

class FormFieldSeed<WidgetType, ValueType, ControllerType> {
  FormFieldSeed({
    required this.invokeController,
    required this.accessData,
  });
  final ControllerType Function(ValueType) invokeController;
  final ValueType Function(ControllerType) accessData;

  // final dynamic Function(Map<String, Expression>) invokeWidget;
}
