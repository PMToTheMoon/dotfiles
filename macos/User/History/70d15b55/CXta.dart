import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    super.key,
    super.initialValue,
    required DateEditingController controller,
  }) : super(
            builder: (state) => DatePickerField(
                  onChanged: state.didChange,
                  controller: controller,
                  initialDate: initialValue,
                ));
}
