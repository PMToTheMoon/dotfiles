import 'package:common/common.dart';
import 'package:flutter/material.dart';

// import 'package:tech_by_tech/app/routes.dart';
import 'package:translations/translations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final tbtRouter = GoRouter(
    routes: [
      StackedRoute(
        path: '/auth',
        builder: (context) => const CandidateHomePage(),
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
      routerDelegate: tbtRouter.delegate,
      routeInformationParser: tbtRouter.parser,
      theme: lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
