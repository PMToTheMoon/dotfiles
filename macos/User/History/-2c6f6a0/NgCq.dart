import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/user/user.dart';

import 'candidate_root.dart';
import 'dashboard/dashboard.dart';
import 'profile/profile.dart';

RouteBase candidateRouteTree(BuildContext context) => ShellRoute(
      // path: '/candidate',
      // Temporary workaround for go router prototype
      path: '/',
      defaultRoute: 'profile',
      redirect: (_) => authGuard(context),
      builder: CandidateRoot.builder,
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
          defaultRoute: 'skills',
          builder: CandidateProfilePageShell.builder,
          routes: [
            StackedRoute(
              path: 'user',
              builder: UserAccountView.builder,
            ),
            StackedRoute(
              path: 'professional-experiences',
              builder: CandidateProfessionalExperiencesView.builder,
            ),
            StackedRoute(
              path: 'background',
              builder: CandidateEducationsView.builder,
            ),
            StackedRoute(
              path: 'skills',
              builder: CandidateSkillsView.builder,
            ),
          ],
        ),
      ],
    );
