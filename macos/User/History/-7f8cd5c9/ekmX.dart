import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

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
            builder: (state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ChipSelector(
                    chips: chips,
                    padding: padding,
                    controller: controller,
                    initialValue: initialValue,
                    onChanged: state.didChange,
                    maxChipSelected: maxChipSelected,
                  ),
                  if (state.hasError)
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.0 + (padding?.left ?? 0),
                      ),
                      child: state.context.bodySmall(
                        state.errorText!,
                        style: const TextStyle(
                          color: Color(0xffd32f2f),
                        ),
                      ),
                    ),
                ],
              );
            });
}
