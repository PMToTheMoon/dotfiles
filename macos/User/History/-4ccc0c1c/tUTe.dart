import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:collection/collection.dart';

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
    if (value.add(chip)) {
      notifyListeners();
    }
  }

  void unselect(String chip) {
    if (value.remove(chip)) {
      notifyListeners();
    }
  }
}

class _ChipSelectorState extends State<ChipSelector> {
  final _controller = ChipSelectorController({});

  void _onChipTapped(String chip, bool selected) {
    if (selected) {
      _controller.select(chip);
    } else {
      _controller.unselect(chip);
    }
  }

  Widget _buildChip(int index, String chip) {
    return Padding(
      padding: index < widget.chips.length - 1
          ? const PaddingSmaller.right()
          : EdgeInsets.zero,
      child: ChoiceChip(
        label: Text(chip),
        shape: s,
        selectedColor: context.colorScheme.primary,
        selected: selected.contains(chip),
        onSelected: (selected) => _onChipTapped(chip, selected),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ValueListenableBuilder(
        valueListenable: _controller,
        builder: (context, Set<String> selected, _) => Row(
          children: widget.chips.mapIndexed(_buildChip).toList(),
        ),
      ),
    );
  }
}
