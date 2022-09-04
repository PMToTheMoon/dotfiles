import 'package:common/common.dart';
import 'package:common/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget notifictaion() => Row(
      children: const [
        NotificationBell(),
        SpaceSmall(),
        NotificationBell(
          notifications: 1,
        ),
        SpaceSmall(),
        NotificationBell(
          notifications: 13,
        ),
      ],
    );
