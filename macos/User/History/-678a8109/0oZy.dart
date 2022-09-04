import 'package:flutter/material.dart';

class InvalidRouteException implements Exception {
  const InvalidRouteException(this.routeSettings);

  final RouteSettings routeSettings;

  @override
  String toString() => 'Invalid route: ${routeSettings.name}';
}

class NestedNavigator extends StatefulWidget {
  const NestedNavigator({
    super.key,
    this.routes,
    this.initialRoute,
    this.home,
    this.navigatorKey,
  }) : assert(home != null || routes != null);

  final GlobalKey<NavigatorState>? navigatorKey;
  final String? initialRoute;
  final Map<String, WidgetBuilder>? routes;
  final Widget? home;

  @override
  State<NestedNavigator> createState() => _NestedNavigatorState();
}

class _NestedNavigatorState extends State<NestedNavigator> {
  late final navigatorKey = widget.navigatorKey ?? GlobalKey<NavigatorState>();

  Future<bool> _onWillPop() async {
    if (navigatorKey.currentState?.canPop() == true) {
      navigatorKey.currentState?.pop();
      return false;
    }
    return true;
  }

  List<Route> _generateInitialRoutes(
    NavigatorState navigator,
    String initialRoute,
  ) =>
      [
        MaterialPageRoute(builder: (context) => widget.home!),
      ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: widget.initialRoute,
      onGenerateInitialRoutes: widget.home != null
          ? _generateInitialRoutes
          : Navigator.defaultGenerateInitialRoutes,
      onGenerateRoute: (RouteSettings settings) {
        final builder = widget.routes?[settings.name];
        if (builder != null) {
          return MaterialPageRoute<void>(
            builder: builder,
            settings: settings,
          );
        }
        throw InvalidRouteException(settings);
      },
    );
  }
}
