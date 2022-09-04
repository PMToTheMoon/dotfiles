import 'package:flutter/material.dart';

class HomeMenuButton extends StatelessWidget {
  const HomeMenuButton({
    Key? key,
  }) : super(key: key);

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: up.Dimensions.icon1,
      icon: AnimatedIcon(
        icon: AnimatedIcons.home_menu,
        progress: controller,
      ),
      onPressed: Scaffold.of(context).openDrawer,
    );
  }
}
