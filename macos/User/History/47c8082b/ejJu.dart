import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    required Widget text,
    CheckboxController? controller,
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
                errorText: state.errorText,
              ),
              child: Row(
                children: [
                  CheckboxField(
                    initialValue: initialValue,
                    controller: controller,
                  ),
                  const SpaceSmallest.w(),
                  Expanded(child: text),
                ],
              ),
            );
          },
        );
}

class CheckboxController extends ValueNotifier<bool> {
  CheckboxController([bool? value]) : super(value ?? false);
}

class CheckboxField extends StatefulWidget {
  const CheckboxField({
    this.initialValue,
    this.controller,
    this.onChanged,
    super.key,
  }) : assert(initialValue == null || controller == null);

  final bool? initialValue;
  final CheckboxController? controller;
  final ValueChanged<bool>? onChanged;

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  late final CheckboxController _controller =
      widget.controller ?? CheckboxController(widget.initialValue);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _controller,
      builder: (context, value, child) => Checkbox(
        value: value,
        onChanged: (newValue) => _controller.value = newValue!,
      ),
    );
  }
}
