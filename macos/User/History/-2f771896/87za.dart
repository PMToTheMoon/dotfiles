import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class ChipEditingController extends ValueNotifier<Set<String>> {
  ChipEditingController({
    Set<String>? value,
  }) : super(value ?? {});

  void add(String input) {
    final chip = toBeginningOfSentenceCase(input) ?? input;
    if (value.add(chip)) {
      notifyListeners();
    }
  }

  void remove(String chip) {
    if (value.remove(chip)) {
      notifyListeners();
    }
  }
}

class ChipEditorField extends StatefulWidget {
  const ChipEditorField({
    this.initialValue,
    this.controller,
    this.onChanged,
    super.key,
  }) : assert(initialValue == null || controller == null);

  final Set<String>? initialValue;
  final ChipEditingController? controller;
  final ValueChanged<Set<String>>? onChanged;
  final bool enabled;

  @override
  ChipEditorFieldState createState() => ChipEditorFieldState();
}

class ChipEditorFieldState extends State<ChipEditorField> {
  ChipEditorFieldState();

  late final _controller =
      widget.controller ?? ChipEditingController(value: widget.initialValue);
  final _textController = TextEditingController();
  final _focus = FocusNode();
  bool _focused = false;
  bool _hovered = false;

  Color get _borderColor {
    if (_focused) return context.tbtColors.secondary;
    if (_hovered) return context.tbtColors.text;
    return context.tbtColors.disabled;
  }

  void _addChip(String input) {
    _textController.clear();
    _controller.add(input);
    _focus.requestFocus();
    widget.onChanged?.call(_controller.value);
  }

  void _removeChip(String chip) {
    _controller.remove(chip);
    widget.onChanged?.call(_controller.value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _focus.requestFocus,
      child: FocusableActionDetector(
        mouseCursor: SystemMouseCursors.text,
        onShowHoverHighlight: (value) => setState(() => _hovered = value),
        onShowFocusHighlight: (value) => setState(() => _focused = value),
        child: AnimatedContainer(
          duration: Feel.durationFast,
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.spaceSmall,
            vertical: Dimensions.spaceSmallest,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
              Dimensions.borderRadiusSmall,
            ),
          ),
          child: ValueListenableBuilder(
            valueListenable: _controller,
            builder: (context, Set<String> value, _) => Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: Dimensions.spaceSmaller,
              runSpacing: Dimensions.spaceSmaller,
              children: [
                ...value.map(
                  (c) => InputChip(
                    labelPadding: const PaddingSmall.left(),
                    label: Text(c),
                    onDeleted: () => _removeChip(c),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: Padding(
                    padding: const PaddingSmallest.vertical(),
                    child: TextField(
                      enabled: ,
                      focusNode: _focus,
                      decoration: null,
                      controller: _textController,
                      onSubmitted: (chip) => _addChip(chip),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
