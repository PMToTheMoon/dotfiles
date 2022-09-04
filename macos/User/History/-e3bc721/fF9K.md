It's possible to extends state full widgets.
You can also extends widget's state and add your own functionalities

usecase example: form fields

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    required Widget text,
    this.controller,
    super.key,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  })  : assert(initialValue == null || controller == null),
        super(
          builder: (FormFieldState<bool> field) {
            final state = field as _CheckboxFormFieldState;
            return InputDecorator(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                errorText: state.errorText,
              ),
              child: CheckboxField(
                text: text,
                controller: state._effectiveController,
                onChanged: state.didChange,
              ),
            );
          },
        );

  final CheckboxFieldController? controller;

  @override
  FormFieldState<bool> createState() => _CheckboxFormFieldState();
}

class _CheckboxFormFieldState extends FormFieldState<bool> {
  late final _controller =
      CheckboxFieldController(_checkboxFormField.initialValue);

  CheckboxFieldController get _effectiveController =>
      _checkboxFormField.controller ?? _controller;

  CheckboxFormField get _checkboxFormField => super.widget as CheckboxFormField;

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.value = widget.initialValue ?? false;
    super.reset();
  }
}