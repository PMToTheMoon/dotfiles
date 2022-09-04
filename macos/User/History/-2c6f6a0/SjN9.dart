import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';

import 'widgets/widgets.dart';
import 'dashboard/dashboard.dart';
import 'profile/profile.dart';

RouteBase candidateRouteTree(BuildContext context) => ShellRoute(
      // path: '/candidate',
      // Temporary workaround for go router prototype
      path: '/',
      defaultRoute: 'profile',
      redirect: (_) => authGuard(context),
      builder: CandidatePageShell.builder,
      routes: [
        NestedStackRoute(
          path: 'ui-kit',
          builder: UiKitPage.builder,
        ),
        NestedStackRoute(
          path: 'dashboard',
          builder: CandidateDashboard.builder,
        ),
        ShellRoute(
          path: 'profile',
          defaultRoute: 'user',
          builder: CandidateProfilePageShell.builder,
          routes: [
            StackedRoute(path: 'user', builder: CandidateUserDetails.builder)
          ],
        ),
      ],
    );
