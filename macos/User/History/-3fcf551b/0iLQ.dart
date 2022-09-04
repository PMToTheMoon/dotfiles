import 'package:flutter/material.dart';

class MultiLineTextFormField extends TextFormField {
  MultiLineTextFormField({
    super.controller,
    super.initialValue,
    super.maxLines,
  }) : super(minLines: 3);
}
