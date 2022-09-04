import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<String> {
  DatePickerFormField({
    super.key,
    super.initialValue,
    super.validator,
    super.autovalidateMode,
    super.enabled,
    super.onSaved,
    super.restorationId,
    required DateEditingController controller,
    String? label,
  }) : super(
          builder: (state) => InputDecorator(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              errorMaxLines: 3,
              errorText: state.errorText,
            ),
            child: DatePickerFieldBase(
              onChanged: state.didChange,
              controller: controller,
              initialDate: initialValue,
              enabled: enabled,
              label: label,
            ),
          ),
        );
}
