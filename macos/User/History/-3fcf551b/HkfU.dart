import 'package:flutter/material.dart';

const _kDefaultLineNumber = 5;

class MultiLineTextFormField extends TextFormField {
  MultiLineTextFormField({
    super.controller,
    super.initialValue,
    int maxLines = _kDefaultLineNumber,
    String? hint,
    super.key,
  }) : super(
          minLines: _kDefaultLineNumber,
          maxLines: maxLines,
        );
}
