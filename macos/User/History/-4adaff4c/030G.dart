import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kRedDotXPos = 0.35;
const _kRedDotYPos = -0.5;
const _kRedDotBlankSpaceWidth = 2.0;
const _kRedDotDiameter = 8.0;

class NotificationBell extends StatelessWidget {
  const NotificationBell({
    Key? key,
    this.showAlertBadge = false,
  }) : super(key: key);

  final bool showAlertBadge;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.sizeMedium,
      width: Dimensions.sizeMedium,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
        color: context.colorScheme.surfaceVariant,
      ),
      child: Stack(
        children: [
          const Center(
            child: Icon(
              FeatherIcons.bell,
              size: Dimensions.iconMedium,
            ),
          ),
          if (showAlertBadge)
            Align(
              alignment: const Alignment(_kRedDotXPos, _kRedDotYPos),
              child: Container(
                color: context.colorScheme.surfaceVariant,
                padding: const EdgeInsets.all(_kRedDotBlankSpaceWidth),
                child: Container(
                  height: _kRedDotDiameter,
                  width: _kRedDotDiameter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_kRedDotDiameter),
                    color: context.theme.extension<BadgeColors>()?.alert,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
