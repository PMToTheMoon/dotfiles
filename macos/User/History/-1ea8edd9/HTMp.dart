export 'widgets/widgets.dart';
export 'dashboard/dashboard.dart';
export 'profile/profile.dart';

final canddiateRoutes = ShellRoute(
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
        // ShellRoute(
        //   path: 'personal-information',
        //   builder: (context, child) => const CandidatePersonalInformation(),
        // ),
        StackedRoute(
          path: 'professional-information',
          builder: (context) => const CandidatePersonalInformation(),
        ),
      ],
    ),
  ],
);
