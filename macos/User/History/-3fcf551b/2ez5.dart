import 'package:flutter/material.dart';

const _kDefaultLineNumber = 5;

class MultiLineTextFormField extends TextFormField {
  MultiLineTextFormField({
    super.controller,
    super.initialValue,
    int maxLines = ,
    super.key,
  }) : super(
          minLines: 3,
          int
        );
}
