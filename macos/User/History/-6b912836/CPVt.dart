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
            inputBuilder: (decoration) => TextField(
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
            inputBuilder: (decoration) => TextFormField(
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

class _TbtTextFieldBase extends StatefulWidget {
  const _TbtTextFieldBase({
    required this.inputBuilder,
    this.decoration,
    super.key,
  });

  final Widget Function(InputDecoration) inputBuilder;
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
      iconColor: MaterialStateColor.resolveWith((states) => Colors.red),
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
        child: widget.inputBuilder(effectiveDecoration),
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
