import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

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
        children: const [
          Icon(
            Zanalys.bell,
            size: Dimensions.iconMedium,
          ),
        ],
      ),
    );
  }
}
