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
                  autofocus: true,
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
                  autofocus: true,
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
  bool _showFocusHighlight = false;
  bool _showHoverHighlight = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.inputDecorationTheme;
    var effectiveDecoration =
        (widget.decoration ?? const InputDecoration()).applyDefaults(theme);
    final labelText = effectiveDecoration.labelText;
    effectiveDecoration = effectiveDecoration.copyWith(
      label: null,
      labelText: '',
      enabledBorder: _showHoverHighlight
          ? effectiveDecoration.enabledBorder?.copyWith(
              borderSide: BorderSide(
                  color: effectiveDecoration.hoverColor ??
                      context.colorScheme.primary))
          : null,
    );

    final labelStyle = TextStyle(
      color: _showFocusHighlight
          ? theme.focusColor ?? context.colorScheme.primary
          : null,
    );

    Widget field = widget.inputBuilder(effectiveDecoration);

    if (labelText != null) {
      field = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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

    return FocusScope(
      canRequestFocus: false,
      child: FocusableActionDetector(
        onShowFocusHighlight: (focused) =>
            setState(() => _showFocusHighlight = focused),
        onShowHoverHighlight: (hovered) =>
            setState(() => _showHoverHighlight = hovered),
        child: field,
      ),
    );
  }
}
