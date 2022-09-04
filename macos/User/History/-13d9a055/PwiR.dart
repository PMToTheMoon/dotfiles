import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neat/neat.dart';

class LabeledTextField extends _LabeledInput {
  LabeledTextField({
    required super.label,
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

class LabeledTextFormField extends _LabeledInput {
  LabeledTextFormField({
    required super.label,
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

class _LabeledInput extends StatefulWidget {
  const _LabeledInput({
    required this.inputBuilder,
    required this.label,
    this.decoration,
    super.key,
  });

  final Widget Function(InputDecoration) inputBuilder;
  final String label;
  final InputDecoration? decoration;

  @override
  State<_LabeledInput> createState() => _LabeledInputState();
}

class _LabeledInputState extends State<_LabeledInput> {
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
    final effectiveDecoration = (widget.decoration ?? const InputDecoration())
        .applyDefaults(theme)
        .copyWith(
          label: null,
          labelText: '',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        );

    final labelStyle = TextStyle(
      color: _hasFocus ? theme.focusColor ?? context.colorScheme.primary : null,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        context.labelMedium(
          widget.label,
          style: labelStyle,
        ),
        MouseRegion(
          onEnter: _onMouseEnter,
          onExit: _onMouseExit,
          child: Focus(
            onFocusChange: _onFocusChange,
            child: widget.inputBuilder(effectiveDecoration),
          ),
        ),
      ],
    );
  }
}
