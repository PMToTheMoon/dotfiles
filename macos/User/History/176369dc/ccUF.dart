import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

enum Priority {
  hight,
  medium,
  low;

  Color color(BuildContext context) {
    final badgeColors = context.theme.extension<BadgeColors>();
    if (badgeColors == null) return context.colorScheme.secondary;
    switch (this) {
      case hight:
        return badgeColors.red;
      case medium:
        return badgeColors.orange;
      case low:
        return badgeColors.green;
      default:
        return context.colorScheme.secondary;
    }
  }

  Color containerColor(BuildContext context) {
    final badgeColors = context.theme.extension<BadgeColors>();
    if (badgeColors == null) return context.colorScheme.secondaryContainer;
    switch (this) {
      case hight:
        return badgeColors.redContainer;
      case medium:
        return badgeColors.orangeContainer;
      case low:
        return badgeColors.greenContainer;
      default:
        return context.colorScheme.secondaryContainer;
    }
  }
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    required this.priority,
    required this.value,
    super.key,
  }) : assert(value >= 0 && value <= 1);

  final Priority priority;

  /// A progress ration between 0 and 1 included.
  /// 0 represent 0% advancement while 1 is 100%.
  final double value;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final emptySpace = constraints.maxWidth * (1 - value);
        final borderRadius = Radius.circular(constraints.maxHeight);
        return Container(
          margin: EdgeInsets.only(right: emptySpace),
          decoration: BoxDecoration(
            color: priority.containerColor(context),
            borderRadius: BorderRadius.circular(constraints.maxHeight),
          ),
          child: value > 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: borderRadius,
                      bottomRight: borderRadius,
                    ),
                    color: priority.color(context),
                  ),
                )
              : const SizedBox.shrink(),
        );
      });
}
