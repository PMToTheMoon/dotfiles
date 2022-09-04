import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.backgroundColor,
    required this.color,
  });

  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.sizeLargest,
      height: Dimensions.sizeLargest,
      decoration: BoxDecoration(
        // color: backgroundColor,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: Column(children: [
        Expanded(
          child: Center(
            child: Container(
              padding: const PaddingSmaller(),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(Dimensions.iconMedium),
              ),
              child: Icon(
                Icons.edit,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        Container(
          padding: const PaddingSmaller(),
          decoration: BoxDecoration(
            // color: context.colorScheme.surface,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(Dimensions.borderRadiusSmall),
              bottomRight: Radius.circular(Dimensions.borderRadiusSmall),
            ),
            border: Border(
              top: BorderSide(color: context.colorScheme.outline),
            ),
          ),
          child: Text("Test"),
          // child: Center(
          //   child: context.titleSmall('Créer un patient',
          //       style: TextStyle(color: context.colorScheme.onSurface)),
          // ),
        ),
      ]),
    );
  }
}
