import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditorFormField extends FormField<Set<String>> {
  ChipEditorFormField({
    required String label,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  }) : super(
          builder: (state) => ChipEditor(
            label: label,
          ),
        );
}
