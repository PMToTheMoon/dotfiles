import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/app/splash_page.dart';
import 'package:tech_by_tech/auth/login/login_page.dart';
import 'package:tech_by_tech/candidate/candidate_home_page.dart';

final routes = <RouteBase>[
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
];
