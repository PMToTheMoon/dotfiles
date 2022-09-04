import 'package:flutter/material.dart';
import 'package:go_router_prototype/go_router_prototype.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
