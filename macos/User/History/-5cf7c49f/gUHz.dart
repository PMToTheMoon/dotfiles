import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

extension ShowZanalysBottomSheetExtension on BuildContext {
  Future<void> showZanalysBottomSheet({
    required String title,
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
      padding: const EdgeInsets.symmetric(
        vertical: Dimensions.paddingSmall,
        horizontal: Dimensions.paddingMedium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.outline,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 33,
              height: 8,
            ),
          ),
          const SpaceLarge(),
          Row(children: [
            Expanded(child: context.headlineMedium("Compléter le parcours")),
            const SpaceSmaller.w(),
            GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Icon(
                Icons.close,
                size: Dimensions.iconMedium,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ]),
          const SpaceSmall(),
          child,
        ],
      ),
    );
  }
}
