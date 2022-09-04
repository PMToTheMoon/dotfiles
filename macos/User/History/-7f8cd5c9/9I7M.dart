import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipSelectorFormField extends FormField<Set<String>> {
  ChipSelectorFormField({
    required Set<String> chips,
    Set<String>? initialValue,
    ChipSelectorController? controller,
    EdgeInsets? padding,
    int? maxChipSelected,
    super.onSaved,
    super.validator,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    super.key,
  })  : assert(initialValue == null || controller == null),
        super(
          initialValue: initialValue ?? controller?.value,
          builder: (state) => ChipSelector(
            chips: chips,
            padding: padding,
            controller: controller,
            initialValue: initialValue,
            onChanged: state.didChange,
            maxChipSelected: maxChipSelected,
          ),
        );
}
