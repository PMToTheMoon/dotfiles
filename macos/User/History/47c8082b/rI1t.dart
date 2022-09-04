import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    required Widget text,
    this.controller,
    super.key,
    super.onSaved,
    super.validator,
    bool? initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  })  : assert(initialValue == null || controller == null),
        super(
          initialValue: initialValue ?? controller?.value,
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

class CheckboxFieldController extends ValueNotifier<bool> {
  CheckboxFieldController([bool? value]) : super(value ?? false);
}

class CheckboxField extends StatefulWidget {
  const CheckboxField({
    required this.text,
    this.initialValue,
    this.controller,
    this.onChanged,
    super.key,
  }) : assert(initialValue == null || controller == null);

  final Widget text;

  final bool? initialValue;
  final CheckboxFieldController? controller;
  final ValueChanged<bool>? onChanged;

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  late final CheckboxFieldController _controller =
      widget.controller ?? CheckboxFieldController(widget.initialValue);

  void _onChanged(bool? newValue) {
    if (newValue == null) return;
    _controller.value = newValue;
    widget.onChanged?.call(newValue);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _controller,
      builder: (context, value, child) => Row(
        children: [
          Checkbox(
            value: value,
            onChanged: _onChanged,
          ),
          const SpaceSmallest.w(),
          widget.text,
        ],
      ),
    );
  }
}
