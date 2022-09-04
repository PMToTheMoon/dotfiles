import 'package:flutter/material.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({
    super.key,
  });

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
