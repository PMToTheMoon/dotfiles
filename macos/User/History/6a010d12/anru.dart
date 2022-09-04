import 'package:common/common.dart';
import 'package:flutter/material.dart';

List<Widget> buttons() => [
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
      const TextButton(onPressed: null, child: Text('Text disabled')),
      const SpaceSmall(),
      contextualMenuButton(),
    ];

Widget contextualMenuButton() {
  return TbtIconMenu(
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
  );
}
