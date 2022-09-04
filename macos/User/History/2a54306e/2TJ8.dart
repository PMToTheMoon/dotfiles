import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TbtTextFormField extends FormField<String> {
  TbtTextFormField({
    super.key,
    super.onSaved,
    super.validator,
    super.enabled,
    super.autovalidateMode,
    super.restorationId,
    this.controller,
    String? initialValue,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autofocus = false,
    int? maxLines = 1,
    int? minLines,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    List<TextInputFormatter>? inputFormatters,
    MouseCursor? mouseCursor,
    InputDecoration? decoration,
  }) : super(
          builder: (FormFieldState<String> field) {
            void onChangeHandler(value) {
              field.didChange(value);
              onChanged?.call(value);
            }

            final state = field as _TbtFormFieldState;
            return TbtTextField(
              controller: state._effectiveController,
              keyboardType: keyboardType,
              textCapitalization: textCapitalization,
              textInputAction: textInputAction,
              autofocus: autofocus,
              maxLines: maxLines,
              minLines: minLines,
              onChanged: onChangeHandler,
              onTap: onTap,
              onEditingComplete: onEditingComplete,
              inputFormatters: inputFormatters,
              enabled: enabled,
              mouseCursor: mouseCursor,
              decoration: decoration?.copyWith(errorText: state.errorText) ??
                  InputDecoration(errorText: state.errorText),
            );
          },
        );

  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _TbtFormFieldState();
}

class _TbtFormFieldState extends FormFieldState<String> {
  late final _controller = TextEditingController(
    text: widget.initialValue,
  );

  TbtTextFormField get _tbtFormField => super.widget as TbtTextFormField;

  TextEditingController get _effectiveController =>
      _tbtFormField.controller ?? _controller;

  @override
  void reset() {
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }
}
