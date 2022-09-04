import 'package:flutter/material.dart';

import 'patient_list/patient_list_page.dart';

const _routes = {
  PatientListPage.route: PatientListPage.builder,
};

class NestedNavigator extends StatefulWidget {
  const NestedNavigator({
    super.key,
  });

  final String initialRoute;
  final Map<String, WidgetBuilder> routes;

  @override
  State<NestedNavigator> createState() => _NestedNavigatorState();
}

class _NestedNavigatorState extends State<NestedNavigator> {
  final navigatorKey = GlobalKey<NavigatorState>();

  Future<bool> _onWillPop() async {
    if (navigatorKey.currentState?.canPop() == true) {
      navigatorKey.currentState?.pop();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Navigator(
        key: navigatorKey,
        initialRoute: PatientListPage.route,
        onGenerateRoute: (RouteSettings settings) {
          final builder = _routes[settings.name];
          if (builder != null) {
            return MaterialPageRoute<void>(
                builder: builder, settings: settings);
          }
          throw Exception('Invalid route: ${settings.name}');
        },
      ),
    );
  }
}
