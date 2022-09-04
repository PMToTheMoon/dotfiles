import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    required Widget text,
    super.key,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  }) : super(
          builder: (state) {
            return InputDecorator(
              decoration: InputDecoration(
                errorText: state.errorText,
              ),
              child: Row(
                children: [
                  Checkbox(value: state.value, onChanged: (_) {}),
                  const SpaceSmallest.w(),
                  Expanded(child: text),
                ],
              ),
            );
          },
        );
}

class CheckboxController extends ValueNotifier<bool> {
  CheckboxController([super.value = false]);
}

class CheckboxField extends StatefulWidget {
  const CheckboxField({
    this.initialValue,
    this.controller,
    super.key,
  }) : assert(initialValue == null || controller == null);

  final bool? initialValue;
  final CheckboxController? controller;

  @override
  State<CheckboxField> createState() => _CheckboxFieldState();
}

class _CheckboxFieldState extends State<CheckboxField> {
  late final CheckboxController _controller =
      widget.controller ?? CheckboxController(value);

  @override
  Widget build(BuildContext context) {
    return const Text('CheckboxField');
  }
}
