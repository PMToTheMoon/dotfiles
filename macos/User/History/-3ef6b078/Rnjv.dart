import 'package:flutter/material.dart';

class ProfilePopover extends StatelessWidget {
  const ProfilePopover({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [TextButton(onPressed: () {}, child: Text("Mon profile"))],
    );
  }
}
