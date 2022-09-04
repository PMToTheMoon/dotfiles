import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    super.key,
    super.initialValue,
    DateEditingController? controller,
  }) : super(
            builder: (state) => DatePickerField(
                  onChanged: state.didChange,
                  controller: controller,
                  initialDate: initialValue,
                ));

  DatePickerFormField.yMMM({
    super.key,
    super.initialValue,
    DateEditingController? controller,
  }) : super(
          builder: (state) => DatePickerField(
            onChanged: state.didChange,
            controller: controller,
            initialDate: initialValue,
          ),
        );
}
