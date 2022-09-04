import 'package:flutter/material.dart';

class InvalidRouteException implements Exception {
  const InvalidRouteException(this.routeSettings);

  final RouteSettings routeSettings;

  String toString() => 'Invalid route: ${routeSettings.name}';
}

class NestedNavigator extends StatefulWidget {
  const NestedNavigator({
    super.key,
    required this.routes,
    this.initialRoute,
  });

  final String? initialRoute;
  final Map<String, WidgetBuilder>? routes;

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
        initialRoute: widget.initialRoute,
        onGenerateRoute: (RouteSettings settings) {
          final builder = widget.routes?[settings.name];
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
