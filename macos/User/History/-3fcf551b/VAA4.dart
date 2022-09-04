import 'package:flutter/material.dart';

const _kDefaultLineNumber = 6;

class MultiLineTextFormField extends TextFormField {
  MultiLineTextFormField({
    super.controller,
    super.initialValue,
    super.validator,
    super.textInputAction,
    int maxLines = _kDefaultLineNumber,
    String? hint,
    bool border = true,
    super.key,
  }) : super(
          minLines: _kDefaultLineNumber,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            errorMaxLines: 3,
            border: border ? null : InputBorder.none,
            focusedBorder: InputBorder.none,
            enabled: InputBorder.none,
          ),
        );
}
