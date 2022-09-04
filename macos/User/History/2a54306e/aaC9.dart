class TbtTextFormField extends _TbtTextFieldBase {
  TbtTextFormField({
    super.key,
    super.decoration,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autofocus = false,
    int? maxLines = 1,
    int? minLines,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    AutovalidateMode? autovalidateMode,
    MouseCursor? mouseCursor,
  }) : super(
            inputBuilder: (context, decoration) => TextFormField(
                  style: enabled == false
                      ? TextStyle(color: context.tbtColors.disabled)
                      : null,
                  decoration: decoration,
                  controller: controller,
                  initialValue: initialValue,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  textCapitalization: textCapitalization,
                  textInputAction: textInputAction,
                  autofocus: autofocus,
                  maxLines: maxLines,
                  minLines: minLines,
                  onChanged: onChanged,
                  onTap: onTap,
                  onEditingComplete: onEditingComplete,
                  onFieldSubmitted: onFieldSubmitted,
                  onSaved: onSaved,
                  validator: validator,
                  inputFormatters: inputFormatters,
                  enabled: enabled,
                  autovalidateMode: autovalidateMode,
                  mouseCursor: mouseCursor,
                ));
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
