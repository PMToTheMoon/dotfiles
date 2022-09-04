import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kRedDotXPos = 0.333;
const _kRedDotYPos = -0.333;
const _kRedDotBlankSpaceWidth = 2.0;
const _kRedDotDiameter = 8.0;

class NotificationBell extends StatelessWidget {
  const NotificationBell({
    Key? key,
  }) : super(key: key);

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
          Center(
            child: const Icon(
              Zanalys.bell,
              size: Dimensions.iconMedium,
            ),
          ),
          Align(
            alignment: Alignment(_kRedDotXPos, _kRedDotYPos),
            child: Container(
              height: _kRedDotDiameter + _kRedDotBlankSpaceWidth,
              width: _kRedDotDiameter + _kRedDotBlankSpaceWidth,
              decoration: BoxDecoration(
                border: Border.all(
                  color: context.colorScheme.surfaceVariant,
                  width: _kRedDotBlankSpaceWidth,
                ),
                borderRadius: BorderRadius.circular(_kRedDotDiameter),
                color: context.theme.extension<BadgeColors>()?.alert,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
