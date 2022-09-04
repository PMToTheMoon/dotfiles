import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditingController extends ValueNotifier<Set<String>> {
  ChipEditingController({
    Set<String>? value,
  }) : super(value ?? {});

  void add(String chip) {
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

class ChipEditor extends StatefulWidget {
  const ChipEditor({
    required this.label,
    this.initialValue,
    this.controller,
    this.onChanged,
    super.key,
  }) : assert(initialValue == null || controller == null);

  final String label;
  final Set<String>? initialValue;
  final ChipEditingController? controller;
  final ValueChanged<Set<String>>? onChanged;

  @override
  ChipEditorState createState() => ChipEditorState();
}

class ChipEditorState extends State<ChipEditor> {
  ChipEditorState();

  late final _controller = widget.controller ?? ChipEditingController();
  final _textController = TextEditingController();
  final _focus = FocusNode();

  void _addChip(String chip) {
    _textController.clear();
    _controller.add(chip);
    _focus.requestFocus();
    widget.onChanged?.call(_controller.value);
  }

  void _removeChip(String chip) {
    _controller.remove(chip);
    widget.onChanged?.call(_controller.value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          focusNode: _focus,
          decoration: InputDecoration(
            labelText: widget.label,
          ),
          // textInputAction: TextInputAction.none,
          controller: _textController,
          onSubmitted: (chip) => _addChip(chip),
        ),
        const SpaceSmaller.h(),
        ValueListenableBuilder(
          valueListenable: _controller,
          builder: (ctx, Set<String> chips, _) => Wrap(
            spacing: Dimensions.spaceSmaller,
            children: chips
                .map((chip) => InputChip(
                      label: Text(chip),
                      onDeleted: () => _removeChip(chip),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
