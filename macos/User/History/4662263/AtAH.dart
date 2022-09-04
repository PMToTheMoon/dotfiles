import 'package:flutter/material.dart';

class PageShell extends StatelessWidget {
  const PageShell({
    required this.menuBar,
    required this.child,
    super.key,
  });

  final Widget menuBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [],
    );
  }
}
