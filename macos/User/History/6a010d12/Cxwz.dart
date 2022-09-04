import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> buttons() => [
      SecondaryButton(onPressed: () {}, child: const Text('Secondary')),
      const SpaceSmall(),
      ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
      const SpaceSmall(),
      const ElevatedButton(onPressed: null, child: Text('Elevated disabled')),
      const SpaceSmall(),
      OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
      const SpaceSmall(),
      const OutlinedButton(onPressed: null, child: Text('Outlined disabled')),
      const SpaceSmall(),
      TextButton(onPressed: () {}, child: const Text('Text')),
      const SpaceSmall(),
      TextButton(onPressed: () {}, child: const Text('Text')),
      const SpaceSmall(),
      const LinkButton(onPressed: null, child: Text('Text disabled')),
      const SpaceSmall(),
      contextualMenuButton(),
    ];

Widget contextualMenuButton() {
  return Builder(
    builder: (context) => Center(
      child: TbtIconMenu(
        icon: Icons.menu,
        children: [
          ContextualMenuButton(
            onPressed: () {},
            child: Text("Test 1"),
          ),
          ContextualMenuButton(
            onPressed: () {},
            child: Text("Test 2"),
          ),
          ContextualMenuButton(
            onPressed: () {},
            child: Text("Test 3"),
          ),
        ],
      ),
    ),
  );
}
