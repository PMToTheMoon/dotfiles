import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/auth.dart';

import 'package:tech_by_tech/candidate/candidate_home_page.dart';
import 'package:translations/translations.dart';

class TechByTechApp extends StatelessWidget {
  const TechByTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (blocContext) => AuthBloc(
          authRepository: blocContext.read(),
        )..add(const AuthEvent.started()),
        child: const _AppRouter(),
      ),
    );
  }
}

class _AppRouter extends StatefulWidget {
  const _AppRouter();

  @override
  State<_AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<_AppRouter> {
  late final RefreshNotifier _refreshNotifier;

  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    _refreshNotifier = RefreshNotifier(
      context.read<AuthBloc>().stream,
    );

    _router = GoRouter(
      refreshListenable: _refreshNotifier,
      routes: [
        StackedRoute(
          path: '/',
          redirect: _splashRedirect,
          builder: (context) => const SplashPage(),
        ),
        NestedStackRoute(
          path: '/auth',
          builder: (context) => const LoginPage(),
        ),
        NestedStackRoute(
          path: '/candidate',
          builder: (context) => const CandidateHomePage(),
        )
      ],
    );
  }

  Future<String?> _splashRedirect(_) async {
    final authState = context.read<AuthBloc>().state;
    return authState.map(
      unknown: (_) => null,
      unauthenticated: (unauthenticated) => '/auth',
      authenticated: (authenticated) => '/candidate',
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refreshNotifier.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TechByTech',
      routerDelegate: _router.delegate,
      routeInformationParser: _router.parser,
      theme: lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

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
