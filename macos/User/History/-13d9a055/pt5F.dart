import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('LabeledTextField');
  }
}

class _LabeledTextField extends StatefulWidget {
  const _LabeledTextField({
    super.key,
    required this.label,
    this.decoration,
  });

  final Widget inputWidget;
  final String label;
  final InputDecoration? decoration;

  @override
  State<LabeledTextField> createState() => _LabeledTextFieldState();
}

class _LabeledTextFieldState extends State<LabeledTextField> {
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
          child: TextField(
            decoration: effectiveDecoration,
            // style: context.textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
