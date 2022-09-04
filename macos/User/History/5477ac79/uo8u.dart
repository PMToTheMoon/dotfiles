import 'package:flutter/material.dart';

import 'splash_body.dart';

class SplashPage extends StatelessWidget {
  static const String route = 'splash';

  static SplashPage builder(BuildContext context) => const SplashPage();

  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashBody();
  }
}
