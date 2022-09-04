import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neat/neat.dart';

class TbtTextField extends _TbtTextFieldBase {
  TbtTextField({
    super.key,
    super.decoration,
    TextEditingController? controller,
    FocusNode? focusNode,
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
    bool? enabled,
    MouseCursor? mouseCursor,
  }) : super(
            inputBuilder: (context, decoration) => TextField(
                  style: enabled == false
                      ? TextStyle(color: context.tbtColors.disabled)
                      : null,
                  decoration: decoration,
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  textCapitalization: textCapitalization,
                  textInputAction: textInputAction,
                  autofocus: autofocus,
                  maxLines: maxLines,
                  minLines: minLines,
                  onChanged: onChanged,
                  onTap: onTap,
                  onEditingComplete: onEditingComplete,
                  inputFormatters: inputFormatters,
                  enabled: enabled,
                  mouseCursor: mouseCursor,
                ));
}

class TbtTextFormField extends _TbtTextFieldBase {
  TbtTextFormField({
    super.key,
    super.decoration,
    TextEditingController? controller,
    String? initialValue,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autofocus = false,
    int? maxLines = 1,
    int? minLines,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    AutovalidateMode? autovalidateMode,
    MouseCursor? mouseCursor,
  }) : super(
            inputBuilder: (context, decoration) => TextFormField(
                  style: enabled == false
                      ? TextStyle(color: context.tbtColors.disabled)
                      : null,
                  decoration: decoration,
                  controller: controller,
                  initialValue: initialValue,
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  textCapitalization: textCapitalization,
                  textInputAction: textInputAction,
                  autofocus: autofocus,
                  maxLines: maxLines,
                  minLines: minLines,
                  onChanged: onChanged,
                  onTap: onTap,
                  onEditingComplete: onEditingComplete,
                  onFieldSubmitted: onFieldSubmitted,
                  onSaved: onSaved,
                  validator: validator,
                  inputFormatters: inputFormatters,
                  enabled: enabled,
                  autovalidateMode: autovalidateMode,
                  mouseCursor: mouseCursor,
                ));
}

mixin CustomFormFieldMixin<FIELD_TYPE, CONTROLLER_TYPE>
    on FormFieldState<FIELD_TYPE> {
  late final _controller =
      CheckboxFieldController(_checkboxFormField.initialValue);

  CheckboxFieldController get _effectiveController =>
      _checkboxFormField.controller ?? _controller;

  CheckboxFormField get _checkboxFormField => super.widget as CheckboxFormField;

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.value = widget.initialValue ?? false;
    super.reset();
  }
}

class _TbtTextFieldBase extends StatefulWidget {
  const _TbtTextFieldBase({
    required this.inputBuilder,
    this.decoration,
    super.key,
  });

  final Widget Function(BuildContext, InputDecoration) inputBuilder;
  final InputDecoration? decoration;

  @override
  State<_TbtTextFieldBase> createState() => _TbtTextFieldBaseState();
}

class _TbtTextFieldBaseState extends State<_TbtTextFieldBase> {
  bool _hasFocus = false;
  bool _isHovered = false;

  void _onFocusChange(bool focus) {
    setState(() {
      _hasFocus = focus;
    });
  }

  void _onMouseEnter(_) {
    setState(() {
      _isHovered = true;
    });
  }

  void _onMouseExit(_) {
    setState(() {
      _isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.inputDecorationTheme;
    var effectiveDecoration =
        (widget.decoration ?? const InputDecoration()).applyDefaults(theme);
    final labelText = effectiveDecoration.labelText;
    effectiveDecoration = effectiveDecoration.copyWith(
      label: null,
      labelText: '',
      enabledBorder: _isHovered
          ? effectiveDecoration.enabledBorder?.copyWith(
              borderSide: BorderSide(
                color: effectiveDecoration.hoverColor ??
                    context.colorScheme.secondary,
              ),
            )
          : null,
    );

    final labelStyle = TextStyle(
      color:
          _hasFocus ? theme.focusColor ?? context.colorScheme.secondary : null,
    );

    final field = MouseRegion(
      onEnter: _onMouseEnter,
      onExit: _onMouseExit,
      child: Focus(
        skipTraversal: true,
        descendantsAreTraversable: true,
        onFocusChange: _onFocusChange,
        child: widget.inputBuilder(context, effectiveDecoration),
      ),
    );

    if (labelText == null) {
      return field;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        context.labelMedium(
          labelText,
          style: labelStyle,
        ),
        const SpaceSmallest.h(),
        field,
      ],
    );
  }
}
