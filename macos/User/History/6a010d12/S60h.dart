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
      LinkButton(onPressed: () {}, text: 'Link button'),
      const SpaceSmall(),
      LinkButton(onPressed: null, text: 'Link button disabled'),
      const SpaceSmall(),
      contextualMenuButton(),
      const SpaceSmall(),
      DeleteButton(onPressed: () {}),
      const SpaceSmall(),
      SaveButton(onPressed: () {}),
      const SpaceSmall(),
      ShareByEmailButton(onPressed: () {}),
      const SpaceSmall(),
      DeleteIconButton(onPressed: () {}),
      const SpaceSmall(),
      const DeleteIconButton(onPressed: null),
    ];

Widget contextualMenuButton() {
  return Builder(
    builder: (context) => TbtIconMenu(
      icon: Icons.menu,
      children: [
        _ContextualMenuButton(
          onPressed: () {},
          child: Text("Test 1"),
        ),
        _ContextualMenuButton(
          onPressed: () {},
          child: Text("Test 2"),
        ),
        _ContextualMenuButton(
          onPressed: () {},
          child: Text("Test 3"),
        ),
      ],
    ),
  );
}
