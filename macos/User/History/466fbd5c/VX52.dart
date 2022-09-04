import 'package:common/common.dart';
import 'package:flutter/material.dart';

class OptionSelectFormField<T> extends FormField<T> {
  OptionSelectFormField({
    super.key,
    super.initialValue,
  }) : super(
          builder: (state) => OptionSelect(
            onChanged: state.didChange,
            value: initialValue,
          ),
        );
}
