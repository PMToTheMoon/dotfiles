import 'package:flutter/material.dart';
import 'package:unusable_player/unusable_player.dart' as up;

class HomeMenuButton extends StatefulWidget {
  const HomeMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  _HomeMenuButtonState createState() => _HomeMenuButtonState();
}

class _HomeMenuButtonState extends State<HomeMenuButton>
    with TickerProviderStateMixin {
  _HomeMenuButtonState();

  late final AnimationController _controller = AnimationController(vsync: this);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: up.Dimensions.icon1,
      icon: const Icon(Icons.settings),
      onPressed: Scaffold.of(context).openDrawer,
    );
  }
}
