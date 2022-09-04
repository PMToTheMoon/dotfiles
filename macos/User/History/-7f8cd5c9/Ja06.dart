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
              final InputDecoration effectiveDecoration = InputDecoration(
                contentPadding: EdgeInsets.zero,
              )
                  .applyDefaults(Theme.of(state.context).inputDecorationTheme);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InputDecorator(
                    decoration: effectiveDecoration.copyWith(errorText: state.errorText),
                    child: ChipSelector(
                      chips: chips,
                      padding: padding,
                      controller: controller,
                      initialValue: initialValue,
                      onChanged: state.didChange,
                      maxChipSelected: maxChipSelected,
                    ),
                  ),
                  if (state.hasError)
                    state.context.labelSmall(
                      state.errorText!,
                                 final InputDecoration effectiveDecoration = (decoration ?? const InputDecoration())
               .applyDefaults(Theme.of(field.context).inputDecorationTheme);
                      style: const TextStyle(
                        color: Color(0xffd32f2f),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              );
            });
}
