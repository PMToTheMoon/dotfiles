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

class AppRouter extends StatefulWidget {
  const AppRouter({
    super.key,
    required this.appBuilder,
  });

  final AppBuilder appBuilder;

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  late final RefreshNotifier _refreshNotifier;

  late final GoRouter _router = GoRouter(
    refreshListenable: _refreshNotifier,
    routes: [
      StackedRoute(
        path: '/',
        builder: (context) => const SplashPage(),
        redirect: _redirectOnAuthStatusChange,
      ),
      ShellRoute(
        path: '/login',
        defaultRoute: 'login',
        redirect: _redirectToHome,
        builder: (context, child) => Scaffold(
          body: child,
          appBar: AppBar(title: const Text("shell")),
        ),
        routes: [
          StackedRoute(
              path: 'login',
              builder: (context) => const LoginPage(),
              routes: []),
        ],
      ),
      StackedRoute(
          path: '/sign-in',
          builder: (context) => const SignInPage(),
          routes: [
            StackedRoute(
              path: 'test',
              builder: (context) => const SignInPage(),
            ),
          ]),
      StackedRoute(
        path: '/candidate',
        builder: (context) => const CandidateHomePage(),
        redirect: _authGuard,
      ),
    ],
  );

  @override
  void initState() {
    super.initState();

    _refreshNotifier = RefreshNotifier(
      context.read<AuthBloc>().stream,
    );
  }

  Future<String?> _redirectOnAuthStatusChange(_) async {
    final authState = context.read<AuthBloc>().state;
    return authState.map(
      unknown: (_) => null,
      unauthenticated: (unauthenticated) => '/auth',
      authenticated: (authenticated) => '/candidate',
    );
  }

  Future<String?> _redirectToHome(_) async {
    final authState = context.read<AuthBloc>().state;
    return authState.mapOrNull(
      authenticated: (unauthenticated) => '/candidate',
    );
  }

  Future<String?> _authGuard(_) async {
    final authState = context.read<AuthBloc>().state;
    return authState.mapOrNull(
      unauthenticated: (unauthenticated) => '/login',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.appBuilder(context, _router.delegate, _router.parser);
  }
}
