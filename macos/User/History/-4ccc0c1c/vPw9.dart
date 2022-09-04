import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class ChipSelector extends StatefulWidget {
  const ChipSelector({
    required this.chips,
    super.key,
  });

  final Set<String> chips;

  @override
  State<ChipSelector> createState() => _ChipSelectorState();
}

class ChipSelectorController extends ValueNotifier<Set<String>> {
  ChipSelectorController(super.value);

  void select(String chip) {
    if (value.contains(chip) == false) {
      value.add(chip);
      notifyListeners();
    }
  }
}

class _ChipSelectorState extends State<ChipSelector> {
  final _controller = ChipSelectorController({});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, Set<String> selected, _) => Row(
          children: widget.chips
              .map((chip) => ChoiceChip(
                    label: Text(chip),
                    selectedColor: context.colorScheme.primary,
                    selected: selected.contains(chip),
                    onSelected: (selected) {
                      if (selected) _controller.select(chip);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
