import 'package:common/common.dart';
import 'package:flutter/material.dart';

@FormFieldSeed({
  'hint': String,
  'validator': String? Function(String?),
  'decorations': InputDecoration,
})
const multiLineTextFormField = r"""
MultiLineTextFormField(
  controller: {{ controller }},
  hint: {{ hint }},
  validator: {{ validator }},
  decorations: {{ decorations }},
)""";
