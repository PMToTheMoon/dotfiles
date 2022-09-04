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
              color: context.colorScheme.outline,
              width: Dimensions.sizeSmall,
              height: 5,
            ),
          ),
          const SpaceSmall(),
          child,
        ],
      ),
    );
  }
}
