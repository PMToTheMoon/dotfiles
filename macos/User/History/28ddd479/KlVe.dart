import 'package:flutter/material.dart';

class DropDownFormField<T> extends FormField<T> {
  DropDownFormField({
    required List<DropdownMenuItem<T>> items,
    super.key,
  }) : super(
          builder: (state) {
            return DropdownButton<T>(
              value: state.value,
              items: items,
              onChanged: state.didChange,
            );
          },
        );
}
