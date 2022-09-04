import 'package:common/common.dart';
import 'package:flutter/material.dart';

class yMMDatePickerFormField extends FormField<DateTime> {
  yMMDatePickerFormField({
    super.key,
    super.initialValue,
    yMMDateEditingController? controller,
  }) : super(
            builder: (state) => yMMDatePickerField(
                  onChanged: state.didChange,
                  controller: controller,
                  initialDate: initialValue,
                ));
}
