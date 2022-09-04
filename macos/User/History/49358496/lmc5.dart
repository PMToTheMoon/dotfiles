import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditorController extends ValueNotifier<Set<String>> {
  ChipEditorController({
    Set<String>? initialValues,
  }) : super(initialValues ?? {});

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

  Set<String> get values => _values;
}

class ChipEditor extends StatefulWidget {
  const ChipEditor({
    required this.label,
    this.initialValue,
    super.key,
  });

  final String label;
  final Set<String>? initialValue;
  final ChipEditorController? controller;

  @override
  ChipEditorState createState() => ChipEditorState();
}

class ChipEditorState extends State<ChipEditor> {
  ChipEditorState();

  late final _controller = widget.controller ?? ChipEditorController();
  final _textController = TextEditingController();
  final _focus = FocusNode();

  late Set<String> chips = widget.initialValue ?? {};

  void _addChip(String chip) {
    _textController.clear();
    _controller.add(chip);
    _focus.requestFocus();
  }

  void _removeChip(String chip) => setState(() {
        chips.remove(chip);
      });

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
          textInputAction: TextInputAction.none,
          controller: _controller,
          onSubmitted: (chip) => _addChip(chip),
        ),
        const SpaceSmaller.h(),
        Wrap(
          spacing: Dimensions.spaceSmaller,
          children: chips
              .map((chip) => InputChip(
                    label: Text(chip),
                    onDeleted: () => _removeChip(chip),
                  ))
              .toList(),
        )
      ],
    );
  }
}
