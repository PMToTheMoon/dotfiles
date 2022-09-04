import 'package:common/common.dart';
import 'package:common/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget notifictaion() => Row(
      children: [
        const NotificationBell(),
        const SpaceSmall(),
        const NotificationBell(
          notifications: 1,
        ),
        const SpaceSmall(),
        NotificationBell(
          onNotificationTap: () {},
          notifications: 13,
        ),
      ],
    );
