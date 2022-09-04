import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/candidate/candidate_home_page.dart';

// import 'package:tech_by_tech/app/routes.dart';
import 'package:translations/translations.dart';

class TechByTechApp extends StatelessWidget {
  TechByTechApp({Key? key}) : super(key: key);

  final _router = GoRouter(
    routes: [
      StackedRoute(
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
