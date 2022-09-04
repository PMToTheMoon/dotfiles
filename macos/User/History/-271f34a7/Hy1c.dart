import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

PreferredSizeWidget authAppBar(BuildContext context) => AppBar(
      centerTitle: false,
      elevation: 0,
      title: Padding(
        padding: const PaddingLarger(left),
        child: context.displayMedium('TechByTech'),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text("Nos service"),
        ),
      ],
    );

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        context.displayMedium('TechByTech'),
        TextButton(
          onPressed: () {},
          child: Text("Nos service"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("A propos"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Contact"),
        ),
      ],
    );
  }
}
