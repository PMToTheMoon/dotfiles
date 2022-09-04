import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
// import 'package:tech_by_tech/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        // routeInformationProvider: _router.routeInformationProvider,
        // routeInformationParser: _router.routeInformationParser,
        // routerDelegate: _router.routerDelegate,
        routerDelegate: _router.delegate,
        routeInformationParser: _router.parser,
        title: 'GoRouter Example',
      );

  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      StackedRoute(
        path: '/',
        builder: (BuildContext context) => const TestScreen(),
      ),
      StackedRoute(
        path: '/page2',
        builder: (BuildContext context) => const TestScreen(),
      ),
    ],
  );
}

class TestScreen extends StatelessWidget {
  const TestScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('TestScreen'),
    );
  }
}
