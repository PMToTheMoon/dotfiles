import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/bloc/auth_bloc.dart';

class CandidateDashboard extends StatelessWidget {
  const CandidateDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SpaceSmall(),
          Text("Candidate dashboard"),
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
          const SpaceSmall(),
          ElevatedButton(
            onPressed: () => RouteState.of(context).goTo('/profile'),
            child: Text("go to profile please"),
          ),
        ],
      ),
    );
  }
}
