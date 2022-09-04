import 'package:common/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neat/neat.dart';

AppBar bannerAppBar(BuildContext context) => AppBar(
      title: Assets.images.urbanDriver.image(),
      elevation: 0,
      backgroundColor: context.colorScheme.background,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.colorScheme.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
      ),
    );

AppBar logoAppBar(
  BuildContext context, {
  List<Widget>? actions,
}) =>
    AppBar(
      title: Assets.images.urbanDriverURed.image(
        fit: BoxFit.contain,
        height: kToolbarHeight,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: context.colorScheme.background,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.colorScheme.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
      ),
      actions: actions,
    );

AppBar titledAppBar(
  BuildContext context, {
  required String title,
  Widget? action,
  VoidCallback? onBack,
}) =>
    AppBar(
      title: Text(
        title,
        style: context.textTheme.headline6,
      ),
      centerTitle: true,
      actions: action != null ? [action] : null,
      elevation: 0,
      backgroundColor: context.colorScheme.background,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: context.colorScheme.background,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemStatusBarContrastEnforced: true,
      ),
    );
