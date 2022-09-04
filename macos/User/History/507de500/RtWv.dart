import 'package:bonemeal/bonemeal.dart';

class FormFieldSeed<ValueType, ControllerType> {
  FormFieldSeed({
    required this.invokeController,
  });
  final ControllerType Function(ValueType) invokeController;
  final dynamic Function(Map<String, Expression>) invokeWidget;
}
