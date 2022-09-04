import 'package:flutter/material.dart';
import 'package:tech_by_tech/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TechByTechApp());
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/auth/sign_in/sign_in_page.dart';
import 'package:tech_by_tech/candidate/candidate_home_page.dart';

class RefreshNotifier extends ChangeNotifier {
  RefreshNotifier(Stream stream) {
    _subscription = stream.listen((event) {
      notifyListeners();
    });
  }

  late final StreamSubscription _subscription;

  @override
  Future<void> dispose() async {
    await _subscription.cancel();
    return super.dispose();
  }
}

typedef AppBuilder = Widget Function(
  BuildContext context,
  RouterDelegate<Object> routerDelegate,
  RouteInformationParser<Object> routeInformationParser,
);

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
        path: '/auth',
        builder: (context, child) => Scaffold(
          body: child,
          appBar: AppBar(title: const Text('Shell')),
        ),
        routes: [
          StackedRoute(
            path: 'login',
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
    return 
    Center(child: Text(RouteState.of(context).route.path),);
  }
}
