import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/candidate/profile/professional_information/candidate_professional_indormation.dart';
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
          path: 'dashboard',
          builder: CandidateDashboard.builder,
        ),
        ShellRoute(
          path: 'profile',
          defaultRoute: 'user',
          builder: CandidateProfilePageShell.builder,
          routes: [
            StackedRoute(path: 'user', builder: UserAccountView.builder),
            StackedRoute(
                path: 'professional-experiences',
                builder: CandidateProfessionalInformation.builder),
          ],
        ),
      ],
    );
