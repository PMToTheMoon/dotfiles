import 'package:flutter/material.dart';

class TbtTextInput extends StatefulWidget {
  const TbtTextInput({
    required this.inputBuilder,
    this.decoration,
    super.key,
  });

  final Widget Function(InputDecoration) inputBuilder;
  final InputDecoration? decoration;

  @override
  State<TbtTextInput> createState() => _TbtTextInputState();
}

class _TbtTextInputState extends State<TbtTextInput> {
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
    effectiveDecoration = effectiveDecoration.copyWith(
      label: null,
      labelText: '',
      enabledBorder: _isHovered
          ? effectiveDecoration.enabledBorder?.copyWith(
              borderSide: BorderSide(
                  color: effectiveDecoration.hoverColor ??
                      context.colorScheme.primary))
          : null,
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
