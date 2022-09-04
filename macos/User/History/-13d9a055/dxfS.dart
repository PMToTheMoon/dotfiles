import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neat/neat.dart';

class LabeledTextField extends _LabeledInput {
  LabeledTextField({
    required super.label,
    super.key,
    super.decoration,
  }) : super(
            inputBuilder: (decoration) => TextField(
                  decoration: decoration,
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
          child: widget.inputBuilder(effectiveDecoration),
        ),
      ],
    );
  }
}
