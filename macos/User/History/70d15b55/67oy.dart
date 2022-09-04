import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DatePickerFormField extends FormField<DateTime> {
  DatePickerFormField({
    super.key,
    super.validator,
    super.autovalidateMode,
    super.enabled,
    super.onSaved,
    super.restorationId,
    required this.controller,
    String? label,
  }) : super(
          initialValue: controller?.date,
          builder: (FormFieldState<DateTime> field) {
            final state = field as _DatePickerFormFieldState;
            return InputDecorator(
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
              child: DatePickerField(
                onChanged: state.didChange,
                controller: state._effectiveController,
                enabled: enabled,
                label: label,
              ),
            );
          },
        );

  final DateEditingController? controller;

  @override
  FormFieldState<DateTime> createState() => _DatePickerFormFieldState();
}

class _DatePickerFormFieldState extends FormFieldState<DateTime> {
  late final _controller =
      DateEditingController.yM(date: _pickerField.initialValue);

  DateEditingController get _effectiveController =>
      _pickerField.controller ?? _controller;

  DatePickerFormField get _pickerField => super.widget as DatePickerFormField;

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.date = widget.initialValue;
    super.reset();
  }
}
