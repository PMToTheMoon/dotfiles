import 'package:flutter/material.dart';

class DropDownFormField extends FormField {
  const DropDownFormField({
    required List<DropdownMenuItem> items,
    super.key,
  }) : super(
          builder: (state) {
            return DropdownButton(items: [, onChanged: onChanged);
          },
        );
}
