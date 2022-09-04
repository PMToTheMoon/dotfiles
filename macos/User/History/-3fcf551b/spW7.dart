import 'package:flutter/material.dart';

const _kDefaultLineNumber = 6;

class MultiLineTextFormField extends TextFormField {
  MultiLineTextFormField({
    super.controller,
    super.initialValue,
    super.validator,
    int maxLines = _kDefaultLineNumber,
    String? hint,
    super.key,
  }) : super(
          minLines: _kDefaultLineNumber,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
          ),
        );
}
