import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TbtMenuBar extends StatelessWidget {
  const TbtMenuBar({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 241,
      child: Material(
        color: context.colorScheme.tertiary,
        child: ListView(
          controller: ScrollController(),
          children: children,
        ),
      ),
    );
  }
}

class TbtMenuLink extends StatelessWidget {
  const TbtMenuLink(
    this.icon,
    this.text, {
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: context.colorScheme.secondary,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(
          left: Dimensions.paddingLarge,
          top: Dimensions.paddingSmaller,
          bottom: Dimensions.paddingSmaller,
          right: Dimensions.paddingSmall,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: Dimensions.iconMedium,
              color: context.colorScheme.onPrimary,
            ),
            const SpaceSmall.w(),
            Expanded(
              child: context.bodyMedium(
                text,
                style: TextStyle(color: context.colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TbtMenuSectionTitle extends StatelessWidget {
  const TbtMenuSectionTitle(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Dimensions.paddingLarge,
        // top: Dimensions.paddingSmaller,
        // bottom: Dimensions.paddingSmaller,
        right: Dimensions.paddingSmall,
      ),
      child: context.bodySmall(
        text,
        style: TextStyle(color: context.colorScheme.onPrimary.withAlpha(128)),
      ),
    );
  }
}

class TbtMenuDivider extends StatelessWidget {
  const TbtMenuDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingSmallest.vertical(),
      child: Divider(
        height: 2,
        color: context.colorScheme.onTertiary.withAlpha(51),
      ),
    );
  }
}
