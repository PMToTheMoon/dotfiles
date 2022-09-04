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
    this.controller,
  }) : super(builder: (FormFieldState<String> field) {
      final 
  });

  final TextEditingController? controller;
}

class _TbtFormFieldState extends FormFieldState<String> {
  late final _controller = TextEditingController(
    text: widget.initialValue,
  );

  TbtTextFormField get _tbtFormField => super.widget as TbtTextFormField;

  TextEditingController get _effectiveController => _tbtFormField.controller ?? _controller;
}
