import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class LabeledTextField extends _LabeledTextField {}

class _LabeledTextField extends StatefulWidget {
  const _LabeledTextField({
    required this.inputBuilder,
    super.key,
    required this.label,
    this.decoration,
  });

  final Widget Function(InputDecoration) inputBuilder;
  final String label;
  final InputDecoration? decoration;

  @override
  State<_LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<_LabeledTextField> {
  bool _hasFocus = false;

  void _onFocusChange(bool focus) {
    setState(() {
      _hasFocus = focus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.inputDecorationTheme;
    final effectiveDecoration = (widget.decoration ?? const InputDecoration())
        .applyDefaults(theme)
        .copyWith(label: null, labelText: '');

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
        Focus(
          onFocusChange: _onFocusChange,
          child: context.inputBuilder(effectiveDecoration),
        ),
      ],
    );
  }
}
