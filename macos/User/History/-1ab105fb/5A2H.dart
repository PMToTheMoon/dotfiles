import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditorFormField extends FormField<Set<String>> {
  ChipEditorFormField({
    required String label,
    Set<String>? initialValue,
    ChipEditorController? controller,
    super.onSaved,
    super.validator,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.key,
  }) : super(
          initialValue: initialValue ?? controller?.value,
          builder: (state) => ChipEditor(
            label: label,
            initialValue: initialValue,
            onChanged: state.didChange,
          ),
        );
}
