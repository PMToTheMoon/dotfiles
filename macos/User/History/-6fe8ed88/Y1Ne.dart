import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Login page"),
          ElevatedButton(
            onPressed: () => RouteState.of(context).goTo('/candidate'),
            child: Text("force candidte route page"),
          ),
        ],
      )),
    );
  }
}
