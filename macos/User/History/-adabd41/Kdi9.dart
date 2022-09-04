import 'package:common/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

Widget notifictaion() => Row(
      children: const [
        NotificationBell(),
        NotificationBell(
          notifications: 1,
        ),
        NotificationBell(
          notifications: 13,
        ),
      ],
    );
