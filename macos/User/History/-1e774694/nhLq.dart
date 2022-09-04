import 'dart:math';
import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';
import 'package:neat/neat.dart';

String get _darkThemeSwitchTitle => "dark_mode_switch".tr;
final _random = Random();

Drawer homeDrawerMenu(BuildContext context) => Drawer(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
                style: BorderStyle.solid,
                color: context.colorScheme.onBackground,
                width: up.Dimensions.borderSize),
          ),
        ),
        child: ListView(children: [
          const up.Space1(),
          const _Pierre2tmProfilePicture(),
          const up.Space2(),
          Row(
            children: [
              IconButton(
                  onPressed: () {}, icon: Icon(up.SocialMediaIcons.github))
            ],
          ),
          SwitchListTile(
            value: Get.isDarkMode,
            title: Text(_darkThemeSwitchTitle),
            onChanged: (_) {
              up.ThemeService.instance.switchThemeMode();
              Navigator.pop(context);
            },
          ),
        ]),
      ),
    );

class _Pierre2tmProfilePicture extends StatelessWidget {
  const _Pierre2tmProfilePicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: up.Suspended(
        maxXShift: 0.25,
        random: _random,
        child: Container(
          padding: const up.Padding5.all(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(up.Dimensions.image1),
            border: Border.all(
              style: BorderStyle.solid,
              color: context.colorScheme.onBackground,
              width: up.Dimensions.borderSize,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(up.Dimensions.image1),
            child: Image.network(
              "https://avatars.githubusercontent.com/u/80128417",
              width: up.Dimensions.image2,
              height: up.Dimensions.image2,
            ),
          ),
        ),
      ),
    );
  }
}
