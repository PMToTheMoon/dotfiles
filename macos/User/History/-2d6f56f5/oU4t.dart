import 'package:common/common.dart';
import 'package:flutter/material.dart';

@FormFieldDeclartion({
  'hint': String,
  'validator': String? Function(String?),
  'decorations': InputDecoration,
})
const dec = r"""
MultiLineTextFormField(
  controller: {{ controller }},
  hint: {{ hint }},
  validator: {{ validator }},
  decorations: {{ decorations }},
)""";
