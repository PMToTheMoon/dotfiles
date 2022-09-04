import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const double _kStatusBarHeight = 4;
const double _kStatusBadgeRadius = Dimensions.sizeSmallest;

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
        final borderRadius = BorderRadius.circular(_kStatusBarHeight);
        return Container(
          padding: EdgeInsets.only(right: emptySpace),
          decoration: BoxDecoration(
            color: priority.containerColor(context),
            borderRadius: borderRadius,
          ),
          height: _kStatusBarHeight,
          width: constraints.maxWidth,
          child: value > 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: priority.color(context),
                  ),
                )
              : const SizedBox.shrink(),
        );
      });
}

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.priority,
  });

  final Priority priority;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_kStatusBadgeRadius);
    return Container(
      padding: const EdgeInsets.all(_kStatusBadgeRadius / 2),
      decoration: BoxDecoration(
        color: priority.containerColor(context),
        borderRadius: BorderRadius.circular(_kStatusBadgeRadius),
      ),
      height: _kStatusBadgeRadius,
      width: _kStatusBadgeRadius,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: priority.color(context),
        ),
      ),
    );
  }
}
