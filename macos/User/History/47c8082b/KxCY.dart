import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({
    Widget text,
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
