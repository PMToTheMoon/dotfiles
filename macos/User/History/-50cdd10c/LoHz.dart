import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_prototype/go_router_prototype.dart';
import 'package:tech_by_tech/auth/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const SpaceSmall(),
          Text("Sign-in page"),
          Text(RouteState.of(context).route.path),
          const SpaceSmall(),
          ElevatedButton(
            onPressed: () => RouteState.of(context).goTo('/candidate'),
            child: Text("force candidte route page"),
          ),
          const SpaceSmall(),
          ElevatedButton(
            onPressed: () => context.read<AuthBloc>().login(),
            child: Text("login"),
          ),
        ],
      )),
    );
  }
}
