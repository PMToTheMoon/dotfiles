class FormFieldSeed<ValueType, ControllerType> {
  FormFieldSeed({
    required this.invokeController,
  });
  final ControllerType Function(ValueType) invokeController;
}
