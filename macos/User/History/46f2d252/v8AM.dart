import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_by_tech/auth/auth.dart';
import 'package:tech_by_tech/candidate/candidate_repository.dart';
import 'package:tech_by_tech/candidate/widgets/candidate_menu_bar.dart';

import 'candidate_app_bar.dart';

/// Inject candidate repository and display common ui for every candidate's pages
class CandidatePageShell extends StatelessWidget {
  static CandidatePageShell builder(BuildContext context, Widget body) =>
      CandidatePageShell(body: body);

  const CandidatePageShell({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final auth = context.select((AuthBloc bloc) => bloc.state);

    return auth.map(authenticated: (auth) => RepositoryProvider(
      create: (context) => UserCandidateRepository(
        authRepository: context.read(),
      ),
      child: PageShell(
        menuBar: const CandidateMenuBar(),
        appBar: const CandidateAppBar(),
        body: body,
      ),
    ),)

    return 
  }
}
