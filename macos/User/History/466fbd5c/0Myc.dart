import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OptionSelectFormField<T> extends FormField<T> {
  OptionSelectFormField({
    super.key,
    required List<T> options,
    super.initialValue,
    OptionSelectController<T>? controller,
  }) : super(
          builder: (state) => HorizontalOptionSelect(
            onChanged: state.didChange,
            initialValue: initialValue,
            options: options,
            controller: controller,
          ),
        );
}
