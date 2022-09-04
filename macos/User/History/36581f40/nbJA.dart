import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class AuthPageShell extends StatelessWidget {
  const AuthPageShell({
    required this.body,
    super.key,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: body,
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: context.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
