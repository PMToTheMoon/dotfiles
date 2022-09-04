import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const double _kStatusBarHeight = 4;
const double _kStatusBadgeSize = Dimensions.sizeSmallest;

enum Status {
  hight,
  medium,
  low,
  done;

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
      case done:
        return badgeColors.blue;
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
      case done:
        return badgeColors.blueContainer;
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

  final Status priority;

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

  final Status priority;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_kStatusBadgeSize);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(_kStatusBadgeSize / 4),
        decoration: BoxDecoration(
          color: priority.containerColor(context),
          borderRadius: BorderRadius.circular(_kStatusBadgeSize),
        ),
        height: _kStatusBadgeSize,
        width: _kStatusBadgeSize,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: priority.color(context),
          ),
        ),
      ),
    );
  }
}

class StatusPercent extends StatelessWidget {
  const StatusPercent({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return context.titleMedium('100%');
  }
}

int _valueToRoundPercent(double value) => (100 * value).round();
