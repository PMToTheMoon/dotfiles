import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

extension ShowZanalysBottomSheetExtension on BuildContext {
  Future<void> showZanalysBottomSheet({
    required Widget child,
  }) =>
      showModalBottomSheet(
        context: this,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
        ),
        // backgroundColor: Colors.blue,
        builder: (c) => ZanalysBottomSheet(child: child),
      );
}

class ZanalysBottomSheet extends StatelessWidget {
  const ZanalysBottomSheet({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const PaddingSmall(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.outline,
                borderRadius: BorderRadius.all(8),
              ),
              width: Dimensions.sizeSmall,
              height: 8,
            ),
          ),
          const SpaceSmall(),
          child,
        ],
      ),
    );
  }
}
