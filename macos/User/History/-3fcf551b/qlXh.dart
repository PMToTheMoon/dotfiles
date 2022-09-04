import 'package:flutter/material.dart';

const _kDefaultLineNumber = 6;

String? convertToHtml(String? text) {
  return text?.replaceAll('\n', '<br>');
}

class MultiLineTextFormField extends TextFormField {
  MultiLineTextFormField({
    super.controller,
    super.initialValue,
    super.validator,
    // super.textInputAction,
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
            focusedBorder: border ? null : InputBorder.none,
            enabledBorder: border ? null : InputBorder.none,
            contentPadding: border ? null : EdgeInsets.zero,
          ),
        );
}
