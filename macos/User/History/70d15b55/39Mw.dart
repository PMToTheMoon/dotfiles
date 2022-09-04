import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField.yMM({
    super.key,
    super.initialValue,
    DateEditingController? controller,
  }) : super(
            builder: (state) => yMMDatePickerField(
                  onChanged: state.didChange,
                  controller: controller,
                  initialDate: initialValue,
                ));
}
