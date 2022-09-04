import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/candidate/candidate.dart';
import 'package:tech_by_tech/candidate/widgets/candidate_menu_bar.dart';
import 'package:tech_by_tech/user/user_account/user_account.dart';

import 'widgets/candidate_app_bar.dart';

/// Inject candidate repository and display common ui for every candidate's pages
class CandidateRoot extends StatelessWidget {
  static CandidateRoot builder(BuildContext context, Widget body) =>
      CandidateRoot(body: body);

  const CandidateRoot({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final auth = context.select((AuthBloc bloc) => bloc.state);

    return auth.when(
      authenticated: (session) => MultiBlocProvider<CandidateBloc>(
        providers: [
          BlocProvider(
            create: (context) => UserAccountBloc(
              session: session,
              userRepository: context.read(),
            )..add(const UserAccountEvent.started()),
          ),
          BlocProvider(
            create: (context) => CandidateBloc(
              session: session,
              candidateRepository: context.read(),
            )..add(const CandidateEvent.started()),
          )
        ],
        child: PageShell(
          menuBar: const CandidateMenuBar(),
          appBar: const CandidateAppBar(),
          body: body,
        ),
      ),
      unauthenticated: () => SizedBox.shrink(),
      unknown: () => SizedBox.shrink(),
    );
  }
}
