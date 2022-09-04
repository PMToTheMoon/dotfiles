import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

abstract class OptionSelect<T> extends StatelessWidget {
  const OptionSelect({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  final T value;
  final List<T> options;
  final ValueChanged<T> onChanged;
}

class HorizontalOptionSelect<T> extends OptionSelect<T> {
  const HorizontalOptionSelect({
    super.key,
    required super.value,
    required super.options,
    required super.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      border: TableBorder.all(
        color: context.tbtColors.border,
        borderRadius: BorderRadius.circular(
          Dimensions.borderRadiusSmallest,
        ),
      ),
      children: [
        TableRow(
          children: options
              .map((item) => _OptionSelectItem(
                    value: item,
                    groupValue: value,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class _OptionSelectItem<T> extends StatefulWidget {
  const _OptionSelectItem({
    super.key,
    required this.value,
    required this.groupValue,
  });

  final T value;
  final T groupValue;

  @override
  State<_OptionSelectItem<T>> createState() => _OptionSelectItemState<T>();
}

class _OptionSelectItemState<T> extends State<_OptionSelectItem<T>> {
  bool get _selected => widget.value == widget.groupValue;

  Color? backgroundColor(BuildContext context) {
    if (_selected) {
      return context.tbtColors.secondaryContainer;
    }
    return context.colorScheme.surface;
  }

  Color? labelColor(BuildContext context) {
    if (widget.value == widget.groupValue) {
      return context.tbtColors.secondary;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor(context),
      child: InkWell(
        onTap: () {},
        hoverColor: context.tbtColors.secondary.withOpacity(.47),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSmall,
            vertical: Dimensions.paddingSmall,
          ),
          child: context.labelLarge(
            widget.value.toString(),
            style: TextStyle(
              color: labelColor(context),
            ),
          ),
        ),
      ),
    );
  }
}
