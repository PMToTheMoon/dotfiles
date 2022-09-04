import 'package:common/common.dart';
import 'package:flutter/material.dart';

extension ShowZanalysBottomSheetExtension on BuildContext {
  Future<void> showZanalysBottomSheet({
    required Widget child,
  }) =>
      showModalBottomSheet(
        context: this,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.borderRadiusMedium),
        ),
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
      padding: const EdgeInsets.only(
        top: Dimensions.paddingLarge,
        left: Dimensions.paddingSmall,
        right: Dimensions.paddingSmall,
        bottom: Dimensions.paddingSmall,
      ),
      // decoration: BoxDecoration(
      //   color: Colors.red,
      // ),
      child: child,
    );
  }
}
