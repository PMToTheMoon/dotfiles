import 'package:common/common.dart';
import 'package:common/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget notifictaion() => Row(
      children: [
        NotificationBell(),
        SpaceSmall(),
        NotificationBell(
          notifications: 1,
        ),
        SpaceSmall(),
        NotificationBell(
          onNotificationTap: () {},
          notifications: 13,
        ),
      ],
    );
