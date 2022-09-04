import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const double _kStatusBarHeight = 4;
const double _kStatusBadgeSize = Dimensions.sizeSmallest;

enum Status {
  red,
  yellow,
  green,
  blue;

  Color color(BuildContext context) {
    final badgeColors = context.theme.extension<BadgeColors>();
    if (badgeColors == null) return context.colorScheme.secondary;
    switch (this) {
      case red:
        return badgeColors.red;
      case yellow:
        return badgeColors.orange;
      case green:
        return badgeColors.green;
      case blue:
        return badgeColors.blue;
      default:
        return context.colorScheme.secondary;
    }
  }

  Color containerColor(BuildContext context) {
    final badgeColors = context.theme.extension<BadgeColors>();
    if (badgeColors == null) return context.colorScheme.secondaryContainer;
    switch (this) {
      case red:
        return badgeColors.redContainer;
      case yellow:
        return badgeColors.orangeContainer;
      case green:
        return badgeColors.greenContainer;
      case blue:
        return badgeColors.blueContainer;
      default:
        return context.colorScheme.secondaryContainer;
    }
  }
}

class StatusBar extends StatelessWidget {
  const StatusBar({
    required this.value,
    this.backgroundColor,
    this.color,
    super.key,
  }) : assert(value >= 0 && value <= 1);

  /// A progress ration between 0 and 1 included.
  /// 0 represent 0% advancement while 1 is 100%.
  final double value;
  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final emptySpace = constraints.maxWidth * (1 - value);
        final borderRadius = BorderRadius.circular(_kStatusBarHeight);
        return Container(
          padding: EdgeInsets.only(right: emptySpace),
          decoration: BoxDecoration(
            color: backgroundColor ?? context.colorScheme.tertiaryContainer,
            borderRadius: borderRadius,
          ),
          height: _kStatusBarHeight,
          width: constraints.maxWidth,
          child: value > 0
              ? Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: color ?? context.colorScheme.tertiary,
                  ),
                )
              : const SizedBox.shrink(),
        );
      });
}

class StatusBadge extends StatelessWidget {
  const StatusBadge(
    this.status, {
    super.key,
  });

  final Status status;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(_kStatusBadgeSize);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(_kStatusBadgeSize / 4),
        decoration: BoxDecoration(
          color: status.containerColor(context),
          borderRadius: BorderRadius.circular(_kStatusBadgeSize),
        ),
        height: _kStatusBadgeSize,
        width: _kStatusBadgeSize,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: status.color(context),
          ),
        ),
      ),
    );
  }
}

class StatusPercent extends StatelessWidget {
  const StatusPercent(
    this.value, {
    super.key,
  }) : assert(value >= 0 && value <= 1);

  final double value;

  @override
  Widget build(BuildContext context) {
    final display = value < 1
        ? '${_valueToRoundPercent(value)}%'
        : context.l10n.status_done_label;
    return context.titleMedium(display);
  }
}

int _valueToRoundPercent(double value) => (100 * value).round();
