import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ChipEditor extends StatefulWidget {
  const ChipEditor({
    super.key,
    Set<String>? initialValue,
  });

  @override
  ChipEditorState createState() => ChipEditorState();
}

class ChipEditorState extends State<ChipEditor> {
  ChipEditorState();

  final _controller = TextEditingController();

  Set<String> chips = {};

  void _addChip(String chip) {
    _controller.clear();
    setState(() {
      chips.add(chip);
    });
  }

  void _removeChip(String chip) => setState(() {
        chips.remove(chip);
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
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
