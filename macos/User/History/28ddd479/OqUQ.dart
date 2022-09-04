import 'package:flutter/material.dart';

class DropDownFormField extends FormField {
  DropDownFormField({
    required List<DropdownMenuItem> items,
    super.key,
  }) : super(
          builder: (state) {
            return DropdownButton(
              items: items,
              onChanged: state.setValue,
            );
          },
        );
}
