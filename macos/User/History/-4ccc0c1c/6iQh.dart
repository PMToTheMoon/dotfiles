import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

export 'package:common/src/theme/theme_data/color_scheme.dart' show BadgeColor;

class ChipSelector extends StatefulWidget {
  const ChipSelector({
    required this.chips,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.selectedColor = BadgeColor.blue,
    this.padding,
    super.key,
  }) : assert(initialValue == null || controller == null);

  final Set<String> chips;
  final BadgeColor selectedColor;
  final Set<String>? initialValue;
  final ChipSelectorController? controller;
  final ValueChanged<Set<String>>? onChanged;
  final EdgeInsets? padding;
  final int? maxChipSelected;

  @override
  State<ChipSelector> createState() => _ChipSelectorState();
}

class ChipSelectorController extends ValueNotifier<Set<String>> {
  ChipSelectorController({
    Set<String>? value,
  }) : super(value ?? {});

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
  late final _controller =
      widget.controller ?? ChipSelectorController(value: widget.initialValue);

  void _onChipTapped(String chip, bool selected) {
    if (selected) {
      _controller.select(chip);
    } else {
      _controller.unselect(chip);
    }
    widget.onChanged?.call(_controller.value);
  }

  Widget _buildChip(int index, String chip, Set<String> selected) {
    final isSelected = selected.contains(chip);
    final shape = isSelected
        ? StadiumBorder(
            side: BorderSide(color: widget.selectedColor.color(context)),
          )
        : null;
    final labelStyle = isSelected
        ? TextStyle(color: widget.selectedColor.color(context))
        : null;
    return Padding(
      padding: index < widget.chips.length - 1
          ? const PaddingSmaller.right()
          : EdgeInsets.zero,
      child: ChoiceChip(
        label: Text(chip),
        labelStyle: labelStyle,
        shape: shape,
        selectedColor: Colors.transparent,
        selected: isSelected,
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
        builder: (context, Set<String> selected, _) => Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: Row(
            children: widget.chips
                .mapIndexed((int index, String chip) => _buildChip(
                      index,
                      chip,
                      selected,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
