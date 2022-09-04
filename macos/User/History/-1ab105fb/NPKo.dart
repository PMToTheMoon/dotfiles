import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditorFormField extends FormField<Set<String>> {
  ChipEditorFormField({
    required String label,
    Set<String>? initialValue,
    ChipEditingController? controller,
    super.onSaved,
    super.validator,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.key,
  })  : assert(initialValue == null || controller == null),
        super(
          initialValue: initialValue ?? controller?.value,
          builder: (state) => ChipEditor(
            label: label,
            controller: controller,
            initialValue: initialValue,
            onChanged: state.didChange,
          ),
        );
}
