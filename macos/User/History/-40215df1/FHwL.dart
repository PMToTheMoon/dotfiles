import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

const double _kCardSize = 149;

class HomeActionCard extends StatelessWidget {
  const HomeActionCard({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.icon,
    required this.text,
  });

  final String text;
  final Color backgroundColor;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _kCardSize,
      height: _kCardSize,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: context.colorScheme.outline),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmall),
      ),
      child: Column(children: [
        Expanded(
          child: Material(
            child: InkWell(
              onTap: () {},
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
    );
  }
}
