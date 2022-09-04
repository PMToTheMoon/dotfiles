import 'package:flutter/material.dart';
import 'package:neat/neat.dart';

class TbtMenuBar extends StatelessWidget {
  const TbtMenuBar({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 241,
      child: Material(
        color: context.colorScheme.tertiary,
        child: ListView(
          controller: ScrollController(),
          children: children,
        ),
      ),
    );
  }
}

class TbtMenuLink extends StatelessWidget {
  const TbtMenuLink(
    this.icon,
    this.text, {
    super.key,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      iconColor: context.colorScheme.onPrimary,
      // tileColor: context.colorScheme.onPrimary,
      textColor: context.colorScheme.onPrimary,
    );
  }
}
