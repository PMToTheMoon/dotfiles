import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

AppBar titleSubtitleAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
}) =>
    AppBar(
      centerTitle: true,
      title: Column(children: [
        context.bodyMedium(subtitle),
        Text(title),
      ]),
    );

AppBar titleAppBar(
  BuildContext context,
  String title,
) =>
    AppBar(
      centerTitle: true,
      title: Text(title),
    );

AppBar titleSubtitleAvatarAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
}) =>
    AppBar(
      centerTitle: true,
      title: Column(children: [
        context.bodyMedium(subtitle),
        Text(title),
      ]),
      actions: [
        CircleAvatar(
          foregroundImage: AssetImage(Assets.images.launcherIcon.keyName),
          radius: Dimensions.sizeSmall / 2,
        ),
        const SpaceSmall.w(),
      ],
    );

AppBar homeAppBar(
  BuildContext context, {
  required String title,
  required String subtitle,
}) =>
    AppBar(
      centerTitle: false,
      titleSpacing: Dimensions.paddingPageMedium,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.bodyMedium(subtitle),
          Text(title),
        ],
      ),
      actions: [
        CircleAvatar(
          foregroundImage: AssetImage(Assets.images.launcherIcon.keyName),
          radius: Dimensions.sizeSmall / 2,
        ),
        const SpaceSmall.w(),
      ],
    );