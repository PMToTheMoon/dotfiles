import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    required Widget text,
    CheckboxFieldController? controller,
    super.key,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  })  : assert(initialValue == null || controller == null),
        super(
          builder: (state) {
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
              child: Row(
                children: [
                  CheckboxField(
                    initialValue: initialValue,
                    controller: controller,
                    onChanged: state.didChange,
                  ),
                  const SpaceSmallest.w(),
                  Expanded(child: text),
                ],
              ),
            );
          },
        );
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
          Expanded(child: widget.text),
        ],
      ),
    );
  }
}
