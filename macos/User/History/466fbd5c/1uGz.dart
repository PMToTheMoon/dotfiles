import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OptionSelectFormField<T> extends FormField<T> {
  OptionSelectFormField({
    super.key,
    super.initialValue,
    required List<T> options,
  }) : super(
          builder: (state) => HorizontalOptionSelect(
            onChanged: state.didChange,
            value: initialValue,
            options: options,
          ),
        );
}
