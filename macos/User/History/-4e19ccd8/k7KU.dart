import 'package:go_router_prototype/go_router_prototype.dart';

final routes = <RouteBase>
  [
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
