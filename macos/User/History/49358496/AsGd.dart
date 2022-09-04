import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditorController {
  Set<String> values;
}

class ChipEditor extends StatefulWidget {
  const ChipEditor({
    required this.label,
    this.initialValue,
    super.key,
  });

  final String label;
  final Set<String>? initialValue;

  @override
  ChipEditorState createState() => ChipEditorState();
}

class ChipEditorState extends State<ChipEditor> {
  ChipEditorState();

  final _controller = TextEditingController();
  final _focus = FocusNode();

  late Set<String> chips = widget.initialValue ?? {};

  void _addChip(String chip) {
    _controller.clear();
    setState(() {
      chips.add(chip);
    });
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
