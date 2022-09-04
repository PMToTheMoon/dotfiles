import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditorFormField extends FormField<Set<String>> {
  ChipEditorFormField()
      : super(
          builder: (state) => ChipEditor(
            label: label,
          ),
        );
}
