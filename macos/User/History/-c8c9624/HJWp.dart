import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
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
        color: context.tbtColors.brandBlue,
        child: ListView(
          controller: ScrollController(),
          children: [
            Padding(
              padding: const PaddingPage.all(),
              child: context.displayMedium('TechByTech',
                  style: TextStyle(
                    color: context.colorScheme.onTertiary,
                  )),
            ),
            const SpaceLarger.h(),
            ...children.intersperse(const SpaceSmaller.h()),
          ],
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
    return Padding(
      padding: const PaddingSmaller.horizontal(),
      child: InkWell(
        hoverColor: Colors.white.withAlpha((255 * .3).toInt()),
        focusColor: Colors.white.withAlpha((255 * .3).toInt()),
        borderRadius: BorderRadius.circular(Dimensions.borderRadiusSmaller),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(
            left: Dimensions.paddingMedium,
            right: Dimensions.paddingSmall,
            top: Dimensions.paddingSmallest,
            bottom: Dimensions.paddingSmallest,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: Dimensions.iconSmall,
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
        left: Dimensions.paddingMedium + Dimensions.paddingSmaller,
        right: Dimensions.paddingSmall + Dimensions.paddingSmaller,
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
    return SizedBox(
      height: Dimensions.spaceMedium,
      child: Divider(
        height: 2,
        color: context.colorScheme.onTertiary.withAlpha(51),
      ),
    );
  }
}
