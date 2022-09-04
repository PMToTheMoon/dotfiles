import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/bloc/auth_bloc.dart';

class CandidateHomePage extends StatelessWidget {
  const CandidateHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Candidate home page")),
      body: Center(
        child: Column(
          children: [
            const SpaceSmall(),
            Text("Candidate home page"),
            Text(RouteState.of(context).route.path),
            const SpaceSmall(),
            ElevatedButton(
              onPressed: () => RouteState.of(context).goTo('/login'),
              child: Text("force route to login"),
            ),
            const SpaceSmall(),
            ElevatedButton(
              onPressed: () => context.read<AuthBloc>().logout(),
              child: Text("logout"),
            ),
          ],
        ),
      ),
    );
  }
}
