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
      body: Center(
        child: Column(
          children: [
            Text("Candidate home page"),
            ElevatedButton(
              onPressed: () => RouteState.of(context).goTo('/auth'),
              child: Text("force route to login"),
            ),
            const SpaceSmall(),
            ElevatedButton(
              onPressed: () => context.read<AuthBloc>().logout(),
              child: Text("logout"),
            )
          ],
        ),
      ),
    );
  }
}
