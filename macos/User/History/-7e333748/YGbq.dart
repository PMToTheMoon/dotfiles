import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/candidate/candidate_home_page.dart';

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
