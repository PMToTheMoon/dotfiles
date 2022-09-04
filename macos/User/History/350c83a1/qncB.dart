import 'package:common/common.dart';
import 'package:flutter/material.dart';

AppBar homeAppBar(
  BuildContext context, {
  required Widget title,
  bool showAlertBadge = false,
}) =>
    AppBar(
      toolbarHeight: 79,
      centerTitle: false,
      titleSpacing: Dimensions.paddingMedium,
      title: title,
      actions: [
        Align(
          alignment: Alignment.center,
          child: NotificationBell(
            showAlertBadge: showAlertBadge,
          ),
        ),
        const SpaceSmall.w(),
      ],
    );
