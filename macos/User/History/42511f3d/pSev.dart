import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/auth/sign_in/sign_in_page.dart';
import 'package:tech_by_tech/auth/widgets/auth_page_shell.dart';
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
      StackedRoute(
        // path: '/',
        // Temporary workaround for go router prototype
        path: '/splash',
        builder: (context) => const SplashPage(),
        redirect: _redirectOnAuthStatusChange,
      ),
      StackedRoute(
        path: '/login',
        builder: (context) => const AuthPageShell(
          body: LoginPage(),
        ),
        redirect: _redirectToHome,
      ),
      StackedRoute(
        path: '/sign-in',
        builder: (context) => const AuthPageShell(
          body: SignInPage(),
        ),
        redirect: _redirectToHome,
      ),
      ShellRoute(
        // path: '/candidate',
        // Temporary workaround for go router prototype
        path: '/',
        defaultRoute: 'ui-kit',
        redirect: _authGuard,
        builder: (context, child) => CandidatePageShell(
          body: child,
        ),
        routes: [
          NestedStackRoute(
            path: 'ui-kit',
            builder: (context) => const UiKitPage(),
          ),
          NestedStackRoute(
            path: 'dashboard',
            builder: (context) => const CandidateDashboard(),
          ),
          ShellRoute(
            path: 'profile',
            defaultRoute: 'personal-information',
            builder: (context, child) => ProfilePageShell(
              body: child,
            ),
            routes: [
              StackedRoute(
                path: 'personal-information',
                builder: (context) => const CandidatePersonalInformation(),
              ),
              // StackedRoute(
              //   path: 'professional-information',
              //   builder: (context) => const CandidateTestPageBody(),
              // ),
            ],
          ),
        ],
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
