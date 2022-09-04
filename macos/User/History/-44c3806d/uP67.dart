import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

AppBar homeAppBar(
  BuildContext context, {
  required String firstName,
  bool showAlertBadge = false,
}) =>
    AppBar(
      toolbarHeight: 79,
      centerTitle: false,
      titleSpacing: Dimensions.paddingPageMedium,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.bodyMedium(context.l10n.home_app_bar_subtitle),
          FittedBox(
            child: context.headlineLarge(
              context.l10n.home_app_bar_title(firstName),
            ),
          ),
        ],
      ),
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
