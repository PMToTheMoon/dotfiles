import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/candidate/candidate.dart';

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
      NestedStackRoute(
        path: '/',
        builder: UiKitPage.builder,
      ),
      // StackedRoute(
      //   // Temporary workaround for go router prototype
      //   // path should be set to '/'
      //   path: '/splash',
      //   builder: (context) => const SplashPage(),
      //   redirect: _redirectOnAuthStatusChange,
      // ),
      // StackedRoute(
      //   path: '/login',
      //   builder: (context) => const AuthPageShell(
      //     body: LoginPageBody(),
      //   ),
      //   redirect: _redirectToHome,
      // ),
      // StackedRoute(
      //   path: '/sign-in',
      //   builder: (context) => const AuthPageShell(
      //     body: SignInPageBody(),
      //   ),
      //   redirect: _redirectToHome,
      // ),
      // candidateRouteTree(context),
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
      unauthenticated: (unauthenticated) => '/login',
      authenticated: (authenticated) => '/',
    );
  }

  Future<String?> _redirectToHome(_) async {
    final authState = context.read<AuthBloc>().state;
    return authState.mapOrNull(
      authenticated: (authenticated) => '/',
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
