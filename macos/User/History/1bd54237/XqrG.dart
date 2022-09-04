import 'dart:async';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/auth.dart';

import 'package:tech_by_tech/candidate/candidate_home_page.dart';

// import 'package:tech_by_tech/app/routes.dart';
import 'package:translations/translations.dart';

class TechByTechApp extends StatelessWidget {
  TechByTechApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (blocContext) => AuthBloc(
          authRepository: blocContext.read(),
        ),
        child: _AppRouter(),
      ),
    );
  }
}

class _AppRouter extends StatefulWidget {
  _AppRouter({
    required this.authStream,
    super.key,
  });

  final Stream authStream;

  @override
  State<_AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<_AppRouter> {
  late final _refreshNotifier = RefreshNotifier(stream);

  final _router = GoRouter(
    routes: [
      StackedRoute(
        path: '/',
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
