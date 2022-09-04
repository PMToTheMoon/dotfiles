import 'package:flutter/material.dart';

class ProfilePageShell extends StatelessWidget {
  const ProfilePageShell({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: body),
      ],
    );
  }
}
