import 'package:flutter/material.dart';

class TbtTextFormField extends FormField<String> {
  TbtTextFormField({
    super.key,
    super.onSaved,
    super.validator,
    super.initialValue,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
  }) : super(builder: (FormFieldState<String> field) {
      final 
  });
}

class _TbtFormFieldState extends FormFieldState<String> {
  late final _controller = TextEditingController(
    text: widget.initialValue,
  );

  TbtTextFormField _tbtFormField => super.widget as TbtTextFormField;

}
