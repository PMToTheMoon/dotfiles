import 'dart:ffi';

import 'package:common/common.dart';
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
    this.onTap,
    super.key,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      minVerticalPadding: 0,
      onTap: onTap,
      iconColor: context.colorScheme.onPrimary,
      textColor: context.colorScheme.onPrimary,
      hoverColor: context.colorScheme.secondary,
    );
  }
}

class TbtMenuSectionTitle extends StatelessWidget {
  const TbtMenuSectionTitle(
    this.text, {
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const PaddingSmall.left(),
      child: context.bodySmall(
        text,
        style: TextStyle(color: context.colorScheme.onPrimary.withAlpha(128)),
      ),
    );
  }
}
