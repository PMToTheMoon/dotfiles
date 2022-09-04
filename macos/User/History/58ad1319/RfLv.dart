import 'package:flutter/material.dart';
import 'package:neat/neat.dart';
import 'package:zanalys/resources/app_colors.dart';

class FullScreenLoader extends StatelessWidget {
  final Color? valueColor;
  final Color? backgroundColor;

  const FullScreenLoader({Key? key, this.valueColor, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Container(
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor,
            valueColor: AlwaysStoppedAnimation(context.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
