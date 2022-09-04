import 'package:flutter/material.dart';

class DropDownFormField extends FormField {
  const DropDownFormField({
    super.key,
  }) : super(
          builder: (state) {
            return DropdownButton(items: items, onChanged: onChanged);
          },
        );
}
