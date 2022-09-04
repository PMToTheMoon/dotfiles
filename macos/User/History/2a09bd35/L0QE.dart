import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/bloc/auth_bloc.dart';

class CandidateTestPageBody extends StatelessWidget {
  const CandidateTestPageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SpaceSmall(),
          Text("TEST"),
          Text(RouteState.of(context).route.path),
          ElevatedButton(
            onPressed: () => RouteState.of(context).goTo('/profile/me'),
            child: Text("go to me"),
          )
        ],
      ),
    );
  }
}

class CandidateProfilePageBody extends StatelessWidget {
  const CandidateProfilePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SpaceSmall(),
          Text("Candidate profile page"),
          Text(RouteState.of(context).route.path),
          ElevatedButton(
            onPressed: () => RouteState.of(context).goTo('/dashboard'),
            child: Text("go to dashboard"),
          ),
          ElevatedButton(
            onPressed: () => RouteState.of(context).goTo('/profile/profess'),
            child: Text("go to profess"),
          ),
        ],
      ),
    );
  }
}
