import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const double _kCardSize = 149;
final BorderRadius _kBorderRadius =
    BorderRadius.circular(Dimensions.borderRadiusSmall);

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final String text;
  final Color backgroundColor;
  final Color color;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _kCardSize,
      height: _kCardSize,
      decoration: BoxDecoration(
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: _kBorderRadius,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: _kBorderRadius,
        child: InkWell(
          onTap: onTap,
          borderRadius: _kBorderRadius,
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
                    size: Dimensions.iconMedium,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
            const Divider(height: 1),
            Container(
              padding: const PaddingSmaller(),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(Dimensions.borderRadiusSmall),
                  bottomRight: Radius.circular(Dimensions.borderRadiusSmall),
                ),
              ),
              child: Center(
                child: context.titleSmall(text),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
