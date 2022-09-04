import 'package:common/common.dart';
import 'package:common/src/widgets/chips/info_chip.dart';
import 'package:common/src/widgets/prefixed_text/icon_text.dart';
import 'package:flutter/material.dart';

class IconTextChip extends StatelessWidget {
  const IconTextChip.small({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    this.iconColor,
  })  : padding = const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSmaller,
          vertical: 2,
        ),
        borderRadius = const BorderRadius.all(
          Radius.circular(Dimensions.borderRadiusMedium),
        );

  const IconTextChip.small({
    super.key,
    required this.icon,
    required this.text,
    required this.backgroundColor,
    this.iconColor,
  })  : padding = const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSmaller,
          vertical: 2,
        ),
        borderRadius = const BorderRadius.all(
          Radius.circular(Dimensions.borderRadiusMedium),
        );

  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color backgroundColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return InfoChip(
      backgroundColor: backgroundColor,
      padding: padding,
      borderRadius: borderRadius,
      child: IconText(
        icon,
        text,
        iconColor: iconColor,
      ),
    );
  }
}
