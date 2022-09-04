import 'package:common/common.dart';
import 'package:common/src/theme/theme_data/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const _kRedDotXPos = 0.333;
const _kRedDotYPos = -0.333;
const _kRedDotDiameter = 10;

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
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: context.theme.extension<BadgeColors>()?.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
