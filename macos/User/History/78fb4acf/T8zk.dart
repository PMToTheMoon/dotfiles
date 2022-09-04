import 'package:common/src/theme/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
    required this.icon,
    required this.badge,
    this.showBadge = true,
    this.badgeAlignment = const Alignment(1.35, -0.35),
  }) : super(key: key);

  final Widget icon;
  final Alignment badgeAlignment;
  final bool showBadge;
  final Widget badge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        icon,
        if (showBadge)
          Positioned.fill(
            child: Align(
              alignment: badgeAlignment,
              child: badge,
            ),
          ),
      ],
    );
  }
}

class NotificationBell extends StatelessWidget {
  const NotificationBell({
    super.key,
    int? notifications,
  }) : notifications = notifications ?? 0;

  final int notifications;

  @override
  Widget build(BuildContext context) {
    return NotificationIcon(
      showBadge: notifications > 0,
      badgeAlignment: const Alignment(1, -1),
      icon: Container(
        margin: const PaddingSmallest(),
        // width: Dimensions.sizeMedium,
        // height: Dimensions.sizeMedium,
        // decoration: BoxDecoration(
        //   color: context.colorScheme.surfaceVariant,
        //   borderRadius: BorderRadius.circular(Dimensions.sizeMedium),
        // ),
        child: IconButton(
          visualDensity: VisualDensity.compact,
          hoverColor: context.colorScheme.primaryContainer,
          onPressed: () {},
          icon: Container(
            width: Dimensions.sizeMedium,
            height: Dimensions.sizeMedium,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(Dimensions.sizeMedium),
            ),
            child: const Icon(
              Icons.notifications_rounded,
              size: Dimensions.iconLarge,
            ),
          ),
        ),
      ),
      badge: Card(
        margin: EdgeInsets.zero,
        color: context.colorScheme.primary,
        elevation: 3,
        child: SizedBox(
          width: 20,
          height: 20,
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: FittedBox(
              child: context.labelSmall(
                notifications.toString(),
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
