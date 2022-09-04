import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  App({
    super.key,
  });

  final GoRouter _router = GoRouter(
    routes: [
      StackedRoute(
        path: '/',
        builder: (context) => const DummyPage(),
      ),
      ShellRoute(
        path: '/shell',
        builder: (context, child) => Scaffold(
          body: child,
          appBar: AppBar(title: const Text('Shell')),
        ),
        routes: [
          StackedRoute(
            path: 'child',
            builder: (context) => const DummyPage(),
          ),
        ],
      ),
      StackedRoute(
        path: '/other',
        builder: (context) => const DummyPage(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.parser,
      routerDelegate: _router.delegate,
    );
  }
}

class DummyPage extends StatelessWidget {
  const DummyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(RouteState.of(context).route.path),
    );
  }
}
