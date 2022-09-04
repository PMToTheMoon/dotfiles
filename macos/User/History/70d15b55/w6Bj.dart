import 'package:common/common.dart';
import 'package:flutter/material.dart';

class MMyDatePickerFormField extends FormField<DateTime> {
  MMyDatePickerFormField({
    super.key,
    super.initialValue,
    yMMDateEditingController? controller,
  }) : super(
            builder: (state) => MMyDatePickerField(
                  onChanged: state.didChange,
                  controller: controller,
                  initialDate: initialValue,
                ));
}
