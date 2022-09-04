import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

const _initialRoute = HomePage.route;

const _routes = {
  HomePage.route: HomePage.builder,
};

class HomeRoot extends StatelessWidget {
  const HomeRoot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NestedNavigator(
      initialRoute: _initialRoute,
      routes: _routes,
    );
  }
}
