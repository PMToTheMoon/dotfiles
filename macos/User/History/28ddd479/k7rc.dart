import 'package:flutter/material.dart';

class TbtDropdownFormField<T> extends FormField<T> {
  TbtDropdownFormField({
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
